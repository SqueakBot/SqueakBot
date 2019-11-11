'use strict';

// prepare the express app
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

// app.level.mw
const app = express();
app.use(cors());
app.use(morgan('dev'));

app.use(express.json());
app.use(express.urlencoded({extended:true}));

// if server is already running
module.exports = {
  server: app,
  start: (port) => {
    app.listen(port, () => {
      console.log(`Server Up on ${port}`);
    });
  },
};
