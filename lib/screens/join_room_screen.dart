import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/resources/socket_methods.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';
import 'package:multiplayer_xoxo/screens/main_menu_screen.dart';
import 'package:multiplayer_xoxo/widget/custom_button.dart';
import 'package:multiplayer_xoxo/widget/custom_text.dart';
import 'package:multiplayer_xoxo/widget/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomIDController = TextEditingController();
  String orgValue = 'EXPLICIT';
  List<String> orgList = [
    'EXPLICIT',
    'JEMMA',
    'GEMS',
    'SME',
    'YES',
    'JPIA',
    'JPMAP',
  ];
  final SocketMethods _socketMethods = SocketMethods();

  void mainMenu(BuildContext context) {
    Navigator.pushNamed(context, MainMenuScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _roomIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Responsive(
            child: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
              text: 'Join Room',
              fontSize: 70,
            ),
            SizedBox(height: size.height * 0.08),
            CustomTextField(
                controller: _nameController, hintText: 'Enter your nickname'),
            SizedBox(height: size.height * 0.025),
            CustomTextField(
                controller: _roomIDController, hintText: 'Enter Room ID'),
            SizedBox(height: size.height * 0.025),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                    color: Colors.blue, style: BorderStyle.solid, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.085),
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButton(
                  borderRadius: BorderRadius.circular(25),
                  isExpanded: true,
                  focusColor: Colors.transparent,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: orgValue,
                  items: orgList.map((String orgList) {
                    return DropdownMenuItem(
                      value: orgList,
                      child: Text(orgList),
                    );
                  }).toList(),
                  onChanged: (String? selectedValue) {
                    setState(() {
                      orgValue = selectedValue!;
                    });
                  }),
            ),
            SizedBox(height: size.height * 0.045),
            CustomButton(
                onTap: () => _socketMethods.joinRoom(
                      _nameController.text,
                      _roomIDController.text,
                      orgValue,
                    ),
                // onTap: () => print(orgValue),
                text: 'Join'),
            SizedBox(height: size.height * 0.023),
            CustomButton(onTap: () => mainMenu(context), text: 'Go Back'),
          ]),
    )));
  }
}
