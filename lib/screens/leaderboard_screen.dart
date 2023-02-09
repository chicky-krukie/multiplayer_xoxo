import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';
import 'package:multiplayer_xoxo/screens/main_menu_screen.dart';
import 'package:multiplayer_xoxo/widget/custom_button.dart';
import 'package:multiplayer_xoxo/widget/custom_text.dart';

class LeaderboardScreen extends StatefulWidget {
  static String routeName = '/leaderboard';
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  void mainMenu(BuildContext context) {
    Navigator.pushNamed(context, MainMenuScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: 'Leaderboard',
                fontSize: 50,
              ),
              const SizedBox(height: 50),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Organization'),
                  ),
                  DataColumn(
                    label: Text('Points'),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('Team A')),
                      DataCell(Text('250')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team B')),
                      DataCell(Text('200')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team C')),
                      DataCell(Text('150')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team D')),
                      DataCell(Text('150')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team E')),
                      DataCell(Text('150')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team F')),
                      DataCell(Text('150')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Team G')),
                      DataCell(Text('150')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              CustomButton(onTap: () => mainMenu(context), text: 'Go Back')
            ],
          ),
        ),
      ),
    );
  }
}
