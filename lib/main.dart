import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/provider/room_data_provider.dart';
import 'package:multiplayer_xoxo/screens/create_room_screen.dart';
import 'package:multiplayer_xoxo/screens/join_room_screen.dart';
import 'package:multiplayer_xoxo/screens/leaderboard_screen.dart';
import 'package:multiplayer_xoxo/screens/main_menu_screen.dart';
import 'package:multiplayer_xoxo/screens/game_screen.dart';
import 'package:multiplayer_xoxo/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => RoomDataProvider()),
        child: MaterialApp(
          title: 'IskoPlay Tic-Tac-Toe',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
          ),
          routes: {
            MainMenuScreen.routeName: (context) => const MainMenuScreen(),
            LeaderboardScreen.routeName: (context) => const LeaderboardScreen(),
            CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
            JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
            GameScreen.routeName: (context) => const GameScreen(),
          },
          initialRoute: MainMenuScreen.routeName,
        ));
  }
}
