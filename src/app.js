// Main express root
const express = require('express');
const app = express();

// Configuration
const { NODE_ENV, CLIENT_ORIGIN } = require('./config');
const morganOpt = (NODE_ENV === 'production') ? 'tiny' : 'common';

// Middleware
const morgan = require('morgan');
const cors = require('cors');
const helmet = require('helmet');

// Routers
const gamesRouter = require('./games/games-router');

app.use(
  morgan(
    morganOpt,
    { skip: () => NODE_ENV === 'test' }
  ),
  helmet(),
  cors({
    origin: CLIENT_ORIGIN
  }),
);

// Basic root path to ensure server is running
app.get('/', (req, res) => {
  res
    .status(200)
    .send('Server is up');
});

// Routes
app.use('/api/games', gamesRouter);

const errorHandler = (err, req, res, next) => {
  let response;
  if (NODE_ENV === 'production') {
    response = { 
      error: { 
        message: 'server error' 
      }
    };
  } else {
    console.error(err);
    response = {
      message: err.message, err
    };
  }
  res.status(500).json(response)
};

app.use(errorHandler);

module.exports = app;