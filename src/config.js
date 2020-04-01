require('dotenv').config();

module.exports = {
  PORT: process.env.PORT || 8000,
  NODE_ENV: process.env.NODE_ENV || 'development',
  TEST_DATABASE_URL: process.env.TEST_DATABASE_URL || 'postgresql://amazement:test@localhost/amazement_test',
  DATABASE_URL: process.env.DATABASE_URL || 'postgresql://amazement:test@localhost/amazement',
  JWT_SECRET: process.env.JWT_SECRET || 'dev-secret',
  CLIENT_ORIGIN: process.env.CLIENT_ORIGIN || "https://amazement.now.sh"
}