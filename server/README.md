# Server using NodeJs

## Overview

This server is built using Node.js and provides several API endpoints for managing meals, calculating nutrients, and searching recipes. It connects to a PostgreSQL database to store and retrieve data.

## API Endpoints Documentation

Please refer to the documentation in the file `server.js`. More human-friendly documentation will be added here in the future.

## Testing the API

You can create a local PostgreSQL database, a local NodeJS server, and a local test client using the scripts provided in this directory. to test the API

1. Create a PostgreSQL database named `eating` using pgAdmin. Then run the file `schema.sql` to create the tables.
2. To add some data to the database, run the file `data.sql`.
3. Create a `.env` file in the root directory of the repository and add the following line:
```DATABASE_URL="postgres://<YOUR_USERNAME>:<YOUR_PASSWORD>@localhost:5432/eating```.
4. Run `node server.js` in a terminal to start the NodeJS server.
5. Run `node test-client.js` in another terminal to create a CLI client that tests every endpoint of the API.

## Known issues

1. Accoring to the testing procedure described above, some endpoints perform database operations successfully but subsequently return an error related to circular references. They return both a response object (with the expected success status code and data) and an error object (with an error status code).

2. According to the testing procedure described above, the endpoint `getRecipes` is not working.