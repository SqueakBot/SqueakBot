'use strict';

// prepare the express app
const express = require('express');
const cors = require('cors');
// const morgan = require('morgan');
// const superagent = require('superagent');
const pg = require('pg');

require('dotenv').config();
const port = process.env.PORT;

// app.level.mw
const app = express();
app.use(cors());
// app.use(morgan('dev'));

app.use(express.json());
app.use(express.urlencoded({extended:true}));

// /////////

const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', err  => console.log(err));

app.get('/questions/challenges', getOneChallenge);

// function getAllChallenges(request, response){
//   let SQL = `SELECT challenges, data_type FROM challenges`;
//   client.query(SQL)
//     .then(results => {
//       response.send(JSON.stringify(results));
//     })
//     .catch(error => response.send(error));
// }

function getOneChallenge(request, response){
  let SQL = `SELECT challenges, data_type FROM challenges`;
  client.query(SQL)
    .then(result => {
      const randomIndex = Math.floor(Math.random() * result.rows.length);
      response.send(JSON.stringify(result.rows[randomIndex]));
    })
    .catch(error => response.send(error));
}

///////////////
// app.get('/question', (req,res,next) => {
//   res.send(JSON.stringify('squeeeeeeeak!'));
// });


///////////////

// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
