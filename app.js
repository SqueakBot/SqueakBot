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

////// Functions that deal with Auth Users //////
function hashingPassword(password){
  return new Promise((resolve, reject) => {
    bycrpt.hash(password, 10 ,(error, hash) => {
      error ? reject(error) : resolve(hash);
    });
  });
}

// creates a new user and saves that to the DB
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
//4
// fetches a user from the db based on a username
async function authenticate(userCreds) {
  //userCreds.username
  //userCreds.password
  let SQL = `SELECT * FROM users WHERE username = $1;`;
  const results = await client.query(SQL, [userCreds.username]);
  const user = results.rows[0];
  const isValid = await bycrpt.compare(userCreds.password, user.password);
  if (isValid) {
    return createUserToken(user);
  } else {
    console.error(err => 'You have an error.');
  }
}
//5
async function createUserToken(user){
  let tokenData = {
    id: user.id,
  };
  var token = await jwt.sign(tokenData, process.env.SECRET || 'changeit' );
  return token;
}
//2
async function authenticateUser(request, response, next){
  // decide which authentication method
  let token = null;
  const [authType, authString] = request.headers.authorization.split(/\s+/);
  switch(authType.toLowerCase()) {

  // exchanging strings for token
  case 'basic':
    token = await authenticateBasic(authString);
    response.send(token);
    break;
  // exchanging token for data;
  case 'bearer':
    token = await authenticateBearer(authString);
    request.token = token;
    next();
    break;
  default:
    console.log('no header auth error');
  }
}
//3
// takes our encoded STRING and finds a user and sends back a token
function authenticateBasic(string){
  let base64Buffer = Buffer.from(string, 'base64');
  let bufferString = base64Buffer.toString();
  let [username, password] = bufferString.split(':');
  let authorize = {username, password};

  // query a user using the username than validate that user with their password
  return authenticate(authorize);
}

async function authenticateBearer(token){
  const parsedToken = jwt.verify(token, process.env.SECRET);

  let SQL = `SELECT * FROM users WHERE id = $1;`;
  const results = await client.query(SQL, [parsedToken.id]);
  const user = results.rows[0];
  return createUserToken(user);
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
//1
app.post('/signin', authenticateUser);


////// Functions that deal with Challenges ///////
function getOneChallenge(request, response){
  client.query(`SELECT * FROM challenges`)
    .then(results => {
      idUsed = results.rowCount;
      console.log(idUsed);
      let randomIndex = Math.floor(Math.random() * results.rows.length) + 1;
      idUsed = randomIndex;
      console.log(idUsed);
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
app.get('/questions/challenges', authenticateUser, getOneChallenge);
app.get('/test', authenticateUser, getTheTestsforChallenge);


// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
