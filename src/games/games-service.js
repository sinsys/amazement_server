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

  // Get top 5 high scores for easy, medium, and hard difficulty
  getHighScores: (db) => {
    return (
      db.union(function() {
        // Get top 5 easy scores
        this
          .select(
            'id',
            'uuid',
            'size',
            'user_id',
            'user_name',
            'difficulty',
            'time_started',
            'time_ended',
            db.raw(`
              (EXTRACT(
                EPOCH FROM (time_ended::timestamp - time_started::timestamp)
              )) AS time_taken
            `)
          )
          .from('games')
          .where('difficulty', 'easy')
          .orderBy('time_taken', 'asc')
          .limit(5)
      }, true)
      .union(function() {
        // Get top 5 medium scores
        this
          .select(
            'id',
            'uuid',
            'size',
            'user_id',
            'user_name',
            'difficulty',
            'time_started',
            'time_ended',
            db.raw(`
              (EXTRACT(
                EPOCH FROM (time_ended::timestamp - time_started::timestamp)
              )) AS time_taken
            `)
          )
          .from('games')
          .where('difficulty', 'medium')
          .orderBy('time_taken', 'asc')
          .limit(5)
      }, true)
      .union(function() {
        // Get top 5 hard scores
        this
          .select(
            'id',
            'uuid',
            'size',
            'user_id',
            'user_name',
            'difficulty',
            'time_started',
            'time_ended',
            db.raw(`
              (EXTRACT(
                EPOCH FROM (time_ended::timestamp - time_started::timestamp)
              )) AS time_taken
            `)
          )
          .from('games')
          .where('difficulty', 'hard')
          .orderBy('time_taken', 'asc')
          .limit(5)
      }, true)
      .orderBy('difficulty', 'asc')
    );
  },

  // Get all data for specific game
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

  // Make sure run isn't submitted multiple times
  gameExists: (db, uuid) => {
    return (
      db('games')
        .where({ uuid })
        .first()
        .then(uuid => !!uuid)
    );
  },

  // Submit a new game
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