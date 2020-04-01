// Router - Games
const { Router, json } = require('express');
const gamesRouter = Router();
const jsonBodyParser = json();
const path = require('path');

// Services
const GamesService = require('./games-service');

gamesRouter
  .route('/')
  .get( (req, res, next) => {
    const knexInst = req.app.get('db');
    GamesService.getGames(knexInst)
      .then(games => {
        return (
          res
            .status(200)
            .json(games)
        );
      })
      .catch(next);
  })
  .post(jsonBodyParser, (req, res, next) => {
    const { uuid, size, maze, player_path, time_started, time_ended, user_id, user_name, difficulty } = req.body;
    const newGame = { uuid, size, maze, player_path, time_started, time_ended, user_name, difficulty };

    for (const [key, value] of Object.entries(newGame))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        })

    if ( user_id ) {
      newGame.user_id = req.body.user_id;
    };
    
    newGame.time_started = new Date(newGame.time_started);
    newGame.time_ended = new Date(newGame.time_ended);
    newGame.time_created = new Date();

    GamesService.addGame(
      req.app.get('db'),
      newGame
    )
      .then(game => {
        res
          .status(201)
          .location(path.posix.join(req.originalUrl, `/${game.uuid}`))
          .json(game)
      })
      .catch(next)
    });

gamesRouter
  .route('/:uuid')
  .all(checkGameExists)
  .get( (req, res, next) => {
    const knexInst = req.app.get('db');
    GamesService.getGameById(
      knexInst,
      req.params.uuid
    )
      .then(game => {
        return (
          res
            .status(200)
            .json(game)
        );
      })
      .catch(next);
  });

/* async/await syntax for promises */
async function checkGameExists(req, res, next) {
  const knexInst = req.app.get('db');
  try {
    const game = await GamesService.getGameById(
      knexInst,
      req.params.uuid
    );

    if (!game)
      return res.status(404).json({
        error: `Game doesn't exist`
      })
    res.game = game;
    next();
  } catch (error) {
    next(error);
  }
};

module.exports = gamesRouter;