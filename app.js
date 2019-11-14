'use strict';

const express = require('express');
const cors = require('cors');
const pg = require('pg');
const bycrpt = require('bcrypt');
const jwt = require('jsonwebtoken');

require('dotenv').config();

let idUsed;

// app.level.mw
const app = express();
app.use(cors());
// app.use(morgan('dev'));

app.use(express.json());
app.use(express.urlencoded({extended:true}));

const client = new pg.Client(process.env.DATABASE_URL);
client.on('error', err  => console.log(err));
client.on('end', () => console.log('ended'));
client.connect();


app.get('/', (request, response) => {
  response.send('welcome');
});

////// Functions that deal with Auth Users //////
function hashingPassword(password){
  return new Promise((resolve, reject) => {
    bycrpt.hash(password, 10 ,(error, hash) => {
      error ? reject(error) : resolve(hash);
    });
  });
}

function createUser(user){
  user.token = createUserToken(user);
  return client.query(`INSERT INTO users (
    username,
    email,
    password,
    token
  ) VALUES (
    $1, $2, $3, $4);`,
  [
    user.username, user.email, user.password, user.token,
  ]);
}

function createUserToken(user){
  let tokenData = {
    id: user.id,
  };
  var token = jwt.sign(tokenData, process.env.SECRET || 'changeit' );
  user.token = token;
  return token;
}

///////// Dealing with Auth Users Routes //////////
app.post('/signup', (request, response, next) => {
  hashingPassword(request.body.password)
    .then(password => {
      request.body.password = password;
      createUser(request.body)
        .then(() => {
          const token = createUserToken(request.body);
          response.send(token);
        })
        .catch((error) => console.error(error));
    });
});

app.post('/signin', (request, response, next) => {
  // if (client.query.includes(request.data.username)) {
  let array = client.query(`SELECT * FROM users`);
  for(let i = 0; i < array.length; i++) {
    if(i.username === request.data.username) {
      if (i.password === request.data.password) {
        return i.token;
      }
    }
  }
});

////// Functions that deal with Challenges ///////
function getOneChallenge(request, response){
  client.query(`SELECT * FROM challenges`)
    .then(results => {
      idUsed = results.rowCount;
      console.log(idUsed);
      let randomIndex = Math.floor(Math.random() * results.rows.length) + 1;
      idUsed = randomIndex;
      // console.log(idUsed);
      console.log(randomIndex);
      // console.log(idUsed, randomIndex);
      client.query(`SELECT id, challenges, data_type FROM challenges WHERE id = $1;`, [idUsed])
        .then(result => {
          //gets one question from the db
          console.log(result);
          response.send(JSON.stringify(result.rows[0].challenges));
          // console.log(JSON.stringify((result.rows[0].challenges)));
          // client.end();
        });
    })
    .catch(error => response.send(error));
}

//// getTestsById
function getTheTestsforChallenge(request, response){
  console.log(idUsed);
  client.query(`SELECT input, output FROM test JOIN challenges ON test.id = challenges.id AND test.id = $1;`, [idUsed])
    .then(testResults => {
      console.log(testResults);
      response.send(JSON.stringify(Object.values(testResults.rows)));
    })
    .catch(error => console.log(error));
}

////// Routes for Challenges /////////
app.get('/questions/challenges', getOneChallenge);
app.get('/test', getTheTestsforChallenge);

// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
