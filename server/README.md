# Server using Node.js

## Overview

This web server is built using Node.js and provides several API endpoints for authentication, managing meals, calculating nutrients, and searching recipes. It connects to a PostgreSQL database to store and retrieve data.

The web server is deployed at https://eating-aa9c7969e33d.herokuapp.com/.

## API Endpoints Documentation

Please refer to the documentation in the file `server.js` for detailed descriptions of endpoints. Refer to the local API testing scripts described in the section below for example usage. More human-friendly documentation may be added here in the future.

### Note on retrying requests

All endpoints of this web server currently do not retry on any failure (such as database transaction failure and network errors); therefore, the client is responsible for implementing retrying logic.

The server guarantees that repeating a request does not produce undesirable effects in the database. For example, when serving an `createMeal` request, there is a possibility that after all necessary inserts into the database have succeeded, the web server encounters an error and returns a response with code 500 to the client. In this case, if the client requests `updateMeal` with the same parameter values again, the server will return a 409 response because a meal with the same user id, type, and datetime truncated to minute already exists in the database, ensuring the meal is not unintentionally duplicated in the database.

## Testing the API locally

Using the scripts provided in this directory, you can create a PostgreSQL database, a Node.js server, and a CLI client on the same host as the Node.js server to test the API. Here are the steps:

1. Create a PostgreSQL database.
2. Run the `schema.sql` script to create the tables. You can use pgAdmin or psql. 
3. To add some data to the database, run the `data.sql` script using psql:
```psql -h <DATABASE_HOST> -U <YOUR_USERNAME> -d <DATABASE_NAME> -f data.sql```
4. Create a `.env` file in current or parent directory and add the following lines:
 * To specify the database: ```DATABASE_URL="postgres://<YOUR_DATABASE_USERNAME>:<YOUR_DATABASE_PASSWORD>@<DATABASE_HOST>:<DATABASE_PORT>/<DATABASE_NAME>"```
 * Optionally, to specify the port to which the Node.js server listens (default = `3000`): ```PORT=<NODEJS_SERVER_PORT>```
5. Run `node server.js` in a terminal to start the Node.js server.
6. Run `node test-client.js` in another terminal to create a CLI client that tests every endpoint of the API. This client must be run in the same host as the Node.js server.

The `test-client.js` script adds a new user into the database and requests every API endpoint. Before each request, the script waits until you press the key "C" on the keyboard so that you have time to examine the database after the previous request.