'use strict';
const express = require('express');
const app = express();
app.use(express.json());
// respond with "hello world" when a GET request is made to the homepage
app.get('/question', function (req, res) {
 res.send(JSON.stringify('Squeeakbot is alive'));
});
// app.get('/challenges', function (req, res) {
//   req.body();
// })
app.listen(3000, () => {
 console.log('Server Up on 3000');
});