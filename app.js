'use strict';

const express = require('express');
const cors = require('cors');
const pg = require('pg');
const cookiesParser = require('cookie-parser');
const bodyParser = require('body-parser');

require('dotenv').config();
const port = process.env.PORT;

// app.level.mw
const app = express();
app.use(cors());
// app.use(morgan('dev'));

app.use(express.json());
app.use(express.urlencoded({extended:true}));

const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', err  => console.log(err));

///////// Dealing with Auth Users Routes //////////

app.post('/signup', (request, response, next) => {

});



////// Functions that deal with Auth Users ///////

////// Routes for Challenges /////////
app.get('/questions/challenges', getOneChallenge);

////// Functions that deal with Challenges ///////
function getOneChallenge(request, response){
  let SQL = `SELECT challenges, data_type FROM challenges`;
  client.query(SQL)
    .then(result => {
      const randomIndex = Math.floor(Math.random() * result.rows.length);
      response.send(JSON.stringify(result.rows[randomIndex]));
    })
    .catch(error => response.send(error));
}

//// getHintforChallenge

//// savedChallenges

//// validateChallenge (checks to see if user has already saved the challenge)

//// getTestsById

// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
