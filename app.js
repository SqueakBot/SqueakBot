'use strict';

const express = require('express');
const cors = require('cors');
const pg = require('pg');
const bycrpt = require('bcrypt');
const jwt = require('jsonwebtoken');

require('dotenv').config();

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
  return client.query(`INSERT INTO users (
    username,
    email,
    password
  ) VALUES (
    $1, $2, $3);`,
  [
    user.username, user.email, user.password,
  ]);
}

function createUserToken(user){
  let tokenData = {
    id: user.id,
  };
  return jwt.sign(tokenData, process.env.SECRET || 'changeit' );
}

function createBearToken(request, response) {
  // if username matches username in database, then we check the password
  client.query(`SELECT * FROM users`)
    .then(results => {
      if (client.query.includes(request.data.username)) {
        for(let i = 0; i < results.length; i++) {
          if(i.username === request.data.username) {
            if (i.password === request.data.password) {
              return createUserToken(i);
            }
          }
        }
      }
    });
  // we generate token using createBearToken function
  //
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
  // createUserToken();
  createBearToken(request);
});

////// Functions that deal with Challenges ///////
function getOneChallenge(request, response){
  client.query(`SELECT * FROM challenges`)
    .then(results => {
      let idUsed = results.rowCount;
      console.log(idUsed);
      let randomIndex = Math.floor(Math.random() * results.rows.length) + 1;
      idUsed = randomIndex;
      console.log(idUsed, randomIndex);
      client.query(`SELECT id, challenges, data_type FROM challenges WHERE id = $1;`, [idUsed])
        .then(result => {
          //gets one question from the db
          console.log(result);
          response.send(JSON.stringify(result.rows[0].challenges));
          console.log(JSON.stringify((result.rows[0].challenges)));
          // client.end();
        });
    })
    .catch(error => response.send(error));
}

//// getHintforChallenge

//// savedChallenges

//// validateChallenge (checks to see if user has already saved the challenge)

//// getTestsById

////// Routes for Challenges /////////
app.get('/questions/challenges', getOneChallenge);

// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
