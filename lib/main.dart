import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/screens/create_room_screen.dart';
import 'package:multiplayer_xoxo/screens/join_room_screen.dart';
import 'package:multiplayer_xoxo/screens/main_menu_screen.dart';
import 'package:multiplayer_xoxo/screens/game_screen.dart';
import 'package:multiplayer_xoxo/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}