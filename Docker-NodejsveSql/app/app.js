const express = require('express');
const mysql = require('mysql2/promise');
require('dotenv').config();

const app = express();
const port = 3000;

app.get('/', async (req, res) => {
    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME,
        });

        const [rows] = await connection.execute('SELECT "Hello, Dockerized MySQL!" AS message');
        res.json(rows[0]);
        await connection.end();
    } catch (err) {
        console.error(err);
        res.status(500).send('Database connection failed!');
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
