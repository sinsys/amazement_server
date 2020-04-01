const app = require('../src/app');
const knex = require('knex');
const helpers = require('./test-helpers');

describe(`Games Endpoints`, () => {
  let db;

  const {
    testUsers,
    testSettings,
    testGames
  } = helpers.makeFixtures();

  before(`Connect to database`, () => {
    db = knex({
      client: 'pg',
      connection: process.env.TEST_DATABASE_URL
    });
    app.set('db', db);
  });

  after(`Disconnect from database`, () => {
    return db.destroy();
  });

  before(`Truncate database and restart identities`, () => {
    return helpers.cleanTables(db);
  });

  afterEach(`Truncate database and restart identities`, () => {
    return helpers.cleanTables(db);
  });

  describe(`GET /api/games`, () => {

    context(`Given no games`, () => {
      
      it(`Responds 200 with an empty list`, () => {
        return (
          supertest(app)
            .get(`/api/games`)
            .expect(200, [])
        );
      });

    });

    context(`Given games`, () => {

      beforeEach('Seed database', () => {
        return (
          helpers.seedTables(
            db,
            testUsers,
            testSettings,
            testGames
          )
        );
      });

      it(`Responds 200 with an array of games`, () => {
        const expectedGames = helpers.makeExpectedGames(testGames);

        return (
          supertest(app)
            .get('/api/games')
            .expect(200, expectedGames)
        );
      });

    });

  });

  describe(`GET /api/games/:uuid`, () => {
    
    context(`Given game does not exist`, () => {

      it(`Responds 404 'Game doesn't exist'`, () => {
        const gameUUID = testGames[0].uuid;
        return (
          supertest(app)
            .get(`/api/games/${gameUUID}`)
            .expect(404)
        );
      });

    });

    context(`Given games`, () => {

      beforeEach('Seed database', () => {
        return (
          helpers.seedTables(
            db,
            testUsers,
            testSettings,
            testGames
          )
        );
      });

      it(`Responds 200 with the proper game`, () => {
        const gameUUID = testGames[0].uuid;
        const expectedGame = helpers.makeExpectedGame(testGames[0]);
        return (
          supertest(app)
            .get(`/api/games/${gameUUID}`)
            .expect(200, expectedGame)
        );
      });

    });

  });

  describe(`POST /api/games`, () => {

    context(`Given no games`, () => {

      beforeEach('Seed database', () => {
        return (
          helpers.seedTables(
            db,
            testUsers,
            [],
            []
          )
        );
      });

      it(`Responds 201 with the created game`, function() {
        const newGame = testGames[0];
        return (
          supertest(app)
            .post(`/api/games`)
            .send(newGame)
            .expect(201)
            .expect(res => {
              expect(res.body).to.have.property('id');
              expect(res.body.uuid).to.eql(newGame.uuid);
              expect(res.body.size).to.eql(newGame.size);
              expect(res.body.maze).to.eql(JSON.parse(newGame.maze));
              expect(res.body.player_path).to.eql(JSON.parse(newGame.player_path));
              expect(res.body.time_started).to.eql(newGame.time_started);
              expect(res.body.time_ended).to.eql(newGame.time_ended);
              expect(res.body.user_id).to.eql(newGame.user_id);
              expect(res.body.user_name).to.eql(newGame.user_name);
              expect(res.body.difficulty).to.eql(newGame.difficulty);
            })
        );
      });

    });

  });

});