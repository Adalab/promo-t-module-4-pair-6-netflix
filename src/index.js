const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

async function getConnection() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '#Irenetp1991',
    database: 'Netflix',
  });

  connection.connect();

  return connection;
}

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

// endpoints
server.get('/movies', async (req, res) => {
  const selectMovies = 'SELECT * FROM movies';
  const connection = await getConnection();
  const [results] = await connection.query(selectMovies);
  console.log(results);
  connection.end();
  res.json(results);
});
