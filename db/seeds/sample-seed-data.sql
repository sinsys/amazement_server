BEGIN;

TRUNCATE
  users,
  settings,
  games
  RESTART IDENTITY CASCADE;

INSERT INTO users (user_name, display_name, password)
VALUES
  ('sinsys', 'sinsys', 'test');

INSERT INTO settings (user_id, character)
VALUES
  (1, 'locke');

INSERT INTO games (uuid, size, maze, player_path, time_started, time_ended, user_id, user_name, difficulty)
VALUES
  (
    '30df3162-02f1-4f35-823b-5eabe5f46544',
    15,
    '[[[0,1,1,0],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,1,0,1],[0,1,0,1],[0,1,1,1],[0,1,0,1],[0,1,0,1],[0,0,1,1]],[[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,0,0],[0,0,1,1],[1,1,0,0],[1,0,0,1],[0,1,1,0],[0,0,0,1],[0,1,1,0],[0,1,0,1],[1,0,0,1],[0,0,1,0],[0,1,1,0],[1,0,0,1]],[[1,0,0,0],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,0,0,1],[0,1,0,0],[0,1,1,1],[1,0,1,1],[1,1,0,0],[0,0,1,1]],[[0,1,1,0],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,1,0,0],[0,1,0,1],[1,0,0,1]],[[1,0,1,0],[0,1,1,0],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,0,0,1]],[[1,0,1,0],[1,0,1,0],[0,0,1,0],[1,1,1,0],[0,1,0,1],[0,1,1,1],[0,1,0,1],[0,0,1,1],[1,1,0,0],[1,0,0,1],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1]],[[1,1,1,0],[1,0,0,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,1,0,0],[0,0,1,1],[1,0,1,0],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[0,1,1,0],[1,0,1,1]],[[1,1,0,0],[0,0,1,1],[1,1,0,0],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,0,0,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,0,1,0]],[[0,0,1,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,1,0,1],[0,1,0,1],[1,0,0,1],[1,1,1,0],[1,0,0,1],[0,0,1,0],[1,0,1,0],[1,0,0,0]],[[1,1,1,0],[0,1,0,1],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[0,1,0,1],[0,0,1,1],[1,0,1,0],[0,1,0,0],[1,0,1,1],[1,1,0,0],[0,0,1,1]],[[1,1,0,0],[0,0,0,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[0,1,1,0],[0,0,1,1],[1,1,0,0],[0,0,1,1],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,1,1],[0,0,1,0],[1,0,1,0]],[[0,1,1,0],[0,1,0,1],[1,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,1,0,0],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,0,1,0]],[[1,1,1,0],[0,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[1,0,0,0],[1,0,1,0],[0,0,1,0],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[1,0,1,0]],[[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,0,0],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,0,1,0]],[[1,0,0,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[1,1,0,1],[0,1,0,1],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,0,0,0],[1,1,0,0],[1,1,0,1],[1,0,0,1]]]',
    '[[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[5,1],[6,1],[6,2],[6,3],[7,3],[7,4],[6,4],[6,5],[6,6],[5,6],[5,5],[4,5],[4,4],[5,4],[5,3],[5,2],[4,2],[4,3],[3,3],[3,4],[3,5],[3,6],[3,7],[4,7],[4,8],[4,9],[4,10],[5,10],[5,9],[6,9],[6,10],[7,10],[7,9],[7,8],[6,8],[6,7],[7,7],[6,7],[6,8],[7,8],[7,9],[7,10],[6,10],[6,9],[5,9],[5,10],[4,10],[4,9],[4,8],[4,7],[3,7],[3,6],[3,5],[3,4],[3,3],[4,3],[4,2],[5,2],[5,3],[5,4],[4,4],[4,5],[5,5],[5,6],[6,6],[6,5],[6,4],[7,4],[7,3],[6,3],[6,2],[6,1],[5,1],[5,0],[4,0],[3,0],[2,0],[1,0],[0,0],[1,0],[1,1],[2,1],[2,2],[1,2],[1,3],[0,3],[0,4],[1,4],[2,4],[2,5],[1,5],[0,5],[0,6],[0,7],[1,7],[1,8],[2,8],[3,8],[3,9],[3,10],[3,11],[4,11],[5,11],[5,12],[6,12],[6,11],[7,11],[8,11],[8,10],[8,9],[9,9],[9,10],[9,11],[10,11],[11,11],[11,10],[10,10],[10,9],[10,8],[10,7],[10,6],[9,6],[9,5],[10,5],[11,5],[11,4],[10,4],[9,4],[9,3],[8,3],[8,2],[7,2],[7,1],[7,0],[8,0],[9,0],[10,0],[11,0],[11,1],[10,1],[9,1],[9,2],[10,2],[11,2],[11,3],[12,3],[12,4],[13,4],[13,3],[14,3],[14,4],[14,5],[13,5],[13,6],[14,6],[14,7],[14,8],[14,9],[14,10],[14,11],[14,12]]',
    '2020-04-01T01:19:02.499Z',
    '2020-04-01T01:20:02.499Z',
    1,
    'sinsys',
    'easy'
  ),
  (
    '30df3162-02f1-4f35-823b-5eabe5f46543',
    15,
    '[[[0,1,1,0],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,1,0,1],[0,1,0,1],[0,1,1,1],[0,1,0,1],[0,1,0,1],[0,0,1,1]],[[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,0,0],[0,0,1,1],[1,1,0,0],[1,0,0,1],[0,1,1,0],[0,0,0,1],[0,1,1,0],[0,1,0,1],[1,0,0,1],[0,0,1,0],[0,1,1,0],[1,0,0,1]],[[1,0,0,0],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,0,0,1],[0,1,0,0],[0,1,1,1],[1,0,1,1],[1,1,0,0],[0,0,1,1]],[[0,1,1,0],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,1,0,0],[0,1,0,1],[1,0,0,1]],[[1,0,1,0],[0,1,1,0],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,0,0,1]],[[1,0,1,0],[1,0,1,0],[0,0,1,0],[1,1,1,0],[0,1,0,1],[0,1,1,1],[0,1,0,1],[0,0,1,1],[1,1,0,0],[1,0,0,1],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1]],[[1,1,1,0],[1,0,0,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,1,0,0],[0,0,1,1],[1,0,1,0],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[0,1,1,0],[1,0,1,1]],[[1,1,0,0],[0,0,1,1],[1,1,0,0],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,0,0,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,0,1,0]],[[0,0,1,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[1,1,0,1],[0,1,0,1],[1,0,0,1],[1,1,1,0],[1,0,0,1],[0,0,1,0],[1,0,1,0],[1,0,0,0]],[[1,1,1,0],[0,1,0,1],[0,0,1,1],[0,1,1,0],[0,1,0,1],[0,1,0,1],[1,0,0,1],[0,1,1,0],[0,1,0,1],[0,0,1,1],[1,0,1,0],[0,1,0,0],[1,0,1,1],[1,1,0,0],[0,0,1,1]],[[1,1,0,0],[0,0,0,1],[1,0,1,0],[1,1,0,0],[0,0,1,1],[0,1,1,0],[0,0,1,1],[1,1,0,0],[0,0,1,1],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,1,1],[0,0,1,0],[1,0,1,0]],[[0,1,1,0],[0,1,0,1],[1,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,1,0],[1,1,0,0],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,0,1,0]],[[1,1,1,0],[0,1,0,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[1,0,0,0],[1,0,1,0],[0,0,1,0],[1,0,1,0],[0,1,1,0],[0,1,0,1],[0,1,0,1],[0,0,1,1],[1,0,1,0]],[[1,0,1,0],[0,1,1,0],[1,0,0,1],[1,0,0,0],[1,0,1,0],[1,1,0,0],[0,0,1,1],[1,0,1,0],[1,0,1,0],[1,0,1,0],[1,0,1,0],[0,1,1,0],[0,0,1,1],[1,0,1,0],[1,0,1,0]],[[1,0,0,0],[1,1,0,0],[0,1,0,1],[0,1,0,1],[1,1,0,1],[0,1,0,1],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,1,0,0],[1,0,0,1],[1,0,0,0],[1,1,0,0],[1,1,0,1],[1,0,0,1]]]',
    '[[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[5,1],[6,1],[6,2],[6,3],[7,3],[7,4],[6,4],[6,5],[6,6],[5,6],[5,5],[4,5],[4,4],[5,4],[5,3],[5,2],[4,2],[4,3],[3,3],[3,4],[3,5],[3,6],[3,7],[4,7],[4,8],[4,9],[4,10],[5,10],[5,9],[6,9],[6,10],[7,10],[7,9],[7,8],[6,8],[6,7],[7,7],[6,7],[6,8],[7,8],[7,9],[7,10],[6,10],[6,9],[5,9],[5,10],[4,10],[4,9],[4,8],[4,7],[3,7],[3,6],[3,5],[3,4],[3,3],[4,3],[4,2],[5,2],[5,3],[5,4],[4,4],[4,5],[5,5],[5,6],[6,6],[6,5],[6,4],[7,4],[7,3],[6,3],[6,2],[6,1],[5,1],[5,0],[4,0],[3,0],[2,0],[1,0],[0,0],[1,0],[1,1],[2,1],[2,2],[1,2],[1,3],[0,3],[0,4],[1,4],[2,4],[2,5],[1,5],[0,5],[0,6],[0,7],[1,7],[1,8],[2,8],[3,8],[3,9],[3,10],[3,11],[4,11],[5,11],[5,12],[6,12],[6,11],[7,11],[8,11],[8,10],[8,9],[9,9],[9,10],[9,11],[10,11],[11,11],[11,10],[10,10],[10,9],[10,8],[10,7],[10,6],[9,6],[9,5],[10,5],[11,5],[11,4],[10,4],[9,4],[9,3],[8,3],[8,2],[7,2],[7,1],[7,0],[8,0],[9,0],[10,0],[11,0],[11,1],[10,1],[9,1],[9,2],[10,2],[11,2],[11,3],[12,3],[12,4],[13,4],[13,3],[14,3],[14,4],[14,5],[13,5],[13,6],[14,6],[14,7],[14,8],[14,9],[14,10],[14,11],[14,12]]',
    '2020-04-01T02:19:02.499Z',
    '2020-04-01T02:22:02.499Z',
    1,
    'sinsys',
    'easy'
  );

COMMIT;