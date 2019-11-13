'use strict';

let app = require('../app');
let request = require('supertest')(app.server);

// afterAll((done) => {

// });

describe('testing the server', () => {
  it('has a valid home route', async (done) => {
    const response = await request.get('/');
    expect(response.status).toBe(200);
    done();
  });

  it('has a working challenges route', async (done) => {
    const response = await request.get('/questions/challenges');
    expect(response.status).toBe(200);
    done();
  });
});
