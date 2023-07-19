const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

async function getConnection() {
  const connection = await mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: process.env.DB_PASS, 
    database: 'netflix',
    port: 3306,
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
  res.json({
    success: true,
    movies: results,
  });
});

//servidor estatico

const staticServerPathWeb = './src/public-movies-images/';
server.use(express.static(staticServerPathWeb));
