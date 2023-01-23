import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/screens/create_room_screen.dart';
import 'package:multiplayer_xoxo/screens/join_room_screen.dart';
import 'package:multiplayer_xoxo/widget/custom_button.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () => createRoom(context), 
              text: 'Create Room'
              ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () => joinRoom(context), 
              text: 'Join Room'
              ),
          ],
        )
      )
    );
  }
}
