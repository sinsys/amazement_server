const GamesService = {

  // Get all games
  getGames: (db) => {
    return (
      db
        .from('games AS game')
        .select(
          'game.id',
          'game.uuid',
          'game.size',
          'game.time_started',
          'game.time_ended',
          'game.time_created',
          'game.user_id',
          'game.user_name',
          'game.difficulty'
        )
    );
  },
  
  getGameById: (db, uuid) => {
    return (
      db
        .from('games AS game')
        .select(
          'game.id',
          'game.uuid',
          'game.size',
          'game.maze',
          'game.player_path',
          'game.time_started',
          'game.time_ended',
          'game.time_created',
          'game.user_id',
          'game.user_name',
          'game.difficulty'          
        )
        .where('game.uuid', uuid)
        .first()
    );
  },

  addGame: (db, newGame) => {
    return (
      db
        .insert(newGame)
        .into('games')
        .returning('*')
        .then(([game]) => game)
        .then(game =>
          GamesService.getGameById(db, game.uuid)
        )
    )
  }
};

module.exports = GamesService;