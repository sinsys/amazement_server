CREATE TABLE users (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_name TEXT NOT NULL,
  display_name TEXT NOT NULL,
  password TEXT NOT NULL,
  date_created TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE TABLE settings (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  character TEXT
);

CREATE TABLE games (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  uuid UUID NOT NULL,
  size INT NOT NULL,
  maze JSONB NOT NULL,
  player_path JSONB NOT NULL,
  time_started TIMESTAMPTZ NOT NULL,
  time_ended TIMESTAMPTZ NOT NULL,
  time_created TIMESTAMPTZ DEFAULT now() NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
  user_name TEXT NOT NULL,
  difficulty TEXT NOT NULL
);
