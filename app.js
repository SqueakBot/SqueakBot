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
  
});

////// Functions that deal with Challenges ///////
function getOneChallenge(request, response){
  client.query(`SELECT id, challenges, data_type FROM challenges WHERE NOT id = $1;`, [idUsed])
    .then(result => {
      const randomIndex = Math.floor(Math.random() * result.rows.length);
      idUsed = result.rows[randomIndex].id;
      //gets one question from the db
      response.send(JSON.stringify(Object.values(result.rows[randomIndex])));
      // client.end();
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
