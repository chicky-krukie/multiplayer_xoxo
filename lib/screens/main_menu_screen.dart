import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/screens/create_room_screen.dart';
import 'package:multiplayer_xoxo/screens/join_room_screen.dart';
import 'package:multiplayer_xoxo/widget/custom_button.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';
import 'package:multiplayer_xoxo/widget/custom_text.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Responsive(
            child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
              shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
              text: 'IskoPlay',
              fontSize: 65),
          const CustomText(
              shadows: [Shadow(blurRadius: 40, color: Colors.red)],
              text: 'Tic-Tac-Toe',
              fontSize: 40),
          SizedBox(height: size.height * 0.04),
          Image.asset(
            'assets/xoxo.png',
            height: 280,
            width: 280,
          ),
          SizedBox(height: size.height * 0.04),
          CustomButton(onTap: () => createRoom(context), text: 'Create Room'),
          const SizedBox(height: 20),
          CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
        ],
      ),
    )));
  }
}
