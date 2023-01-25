const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

require('dotenv').config()

const app = express();
const port = process.env.PORT | 3000;
var server = http.createServer(app);
const Room = require('./models/room');

var io = require('socket.io')(server);

app.use(express.json());

const database = process.env.DB_URL;

io.on('connection', (socket) => {
    console.log('Socket.io connection established');
    socket.on('createRoom', async ({ nickname }) => {
        console.log(nickname);
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;
            room = await room.save();

            console.log(room);
            const roomID = room._id.toString();
            socket.join(roomID);

            io.to(roomID).emit('createRoomSuccess', room);

        } catch (e) {
            console.log(e);
        }
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