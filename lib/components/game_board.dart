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
      roomDataProvider.player1,
      roomDataProvider.player2,
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
        child: AbsorbPointer(
          absorbing: roomDataProvider.roomData['turn']['socketID'] != _socketMethods.socketClient.id,
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
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                          roomDataProvider.displayElements[index],
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                          shadows: [
                            Shadow(
                              blurRadius: 40,
                              color: roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'EXPLICIT' || roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'EXPLICIT'
                                  ? Colors.blue.shade900
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'JEMMA' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'JEMMA'
                                  ? Colors.purple
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'GEMS' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'GEMS'
                                  ? Colors.lightBlue
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'JPIA' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'JPIA'
                                  ? Colors.yellow
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'YES' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'YES'
                                  ? Colors.green
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'SME' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'SME'
                                  ? Colors.red
                                  : roomDataProvider.displayElements[index] == 'X' && roomDataProvider.player1.playerOrg == 'JPMAP' || roomDataProvider.displayElements[index] == 'O' && roomDataProvider.player2.playerOrg == 'JPMAP'
                                  ? Colors.pink
                                  : Colors.orange,
                            )
                          ],
                                              ),
                                            ),
                        ))),
              );
            },
          ),
        ));
  }
}
