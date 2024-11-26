# Server using NodeJs

## Overview

This server is built using Node.js and provides several API endpoints for managing meals, calculating nutrients, and searching recipes. It connects to a PostgreSQL database to store and retrieve data.

## API Endpoints Documentation

Please refer to the documentation in the file `server.js`. More human-friendly documentation will be added here in the future.

## Testing the API

Using the scripts provided in this directory, you can create a local PostgreSQL database, a local NodeJS server, and a local CLI client to test the API. Here are the steps:

1. Create a PostgreSQL database named `eating` using pgAdmin. Then run the file `schema.sql` to create the tables.
2. To add some data to the database, run the file `data.sql`.
3. Create a `.env` file in the root directory of the repository and add the following line:
```DATABASE_URL="postgres://<YOUR_USERNAME>:<YOUR_PASSWORD>@localhost:5432/eating```.
4. Run `node server.js` in a terminal to start the NodeJS server.
5. Run `node test-client.js` in another terminal to create a CLI client that tests every endpoint of the API. This script will add a new user into the database and request every API endpoint. Before each request, the script waits until you press the key "C" before continuing so that you have time to examine the database after the previous request.