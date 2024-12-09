const { Pool } = require('pg');

// Load environment variables from .env file when running on development machine
// Use Heroku's config vars when running on Heroku
const fs = require('fs');
const path = require('path');
if (process.env.NODE_ENV !== 'production') {
  let dotenvPath = path.resolve(__dirname, '.env');
  if (!fs.existsSync(dotenvPath)) {
    dotenvPath = path.resolve(__dirname, '../.env');
  }
  require('dotenv').config({ path: dotenvPath });
}

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : undefined
});

module.exports = {
  query: (text, params) => pool.query(text, params),
  connect: () => pool.connect(),
};