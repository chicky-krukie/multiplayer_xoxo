const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

require('dotenv').config()

const app = express();
const port = process.env.PORT | 3000;
var server = http.createServer(app);

var io = require('socket.io')(server);

app.use(express.json());

const database = process.env.DB_URL;

io.on('connection', (socket) => {
    console.log('Socket.io connection established');
    socket.on('createRoom', ({ nickname }) => {
        console.log(nickname);
    });
});

mongoose.set('strictQuery', true);
mongoose.connect(database).then(() => {
    console.log('Connection successful');
}).catch((e) => {
    console.log(e);
});

server.listen(port, '0.0.0.0', () => {
    console.log(`Server started and running on port ${port}`);
});