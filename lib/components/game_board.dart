import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/provider/room_data_provider.dart';
import 'package:multiplayer_xoxo/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }
  
  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(
      index,
      roomDataProvider.roomData['_id'],
      roomDataProvider.displayElements,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.7,
          maxWidth: 500,
        ),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => tapped(index, roomDataProvider),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    roomDataProvider.displayElements[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      shadows: [
                        Shadow(
                          blurRadius: 40,
                          color: roomDataProvider.displayElements[index] == 'O'
                              ? Colors.red
                              : Colors.blue,
                        )
                      ],
                    ),
                  ))),
            );
          },
        ));
  }
}