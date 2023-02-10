import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/widget/custom_button.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';

import '../resources/socket_methods.dart';
import '../utils/colors.dart';
import '../widget/custom_text_field.dart';

class PlayAgainScreen extends StatefulWidget {
  static String routeName = '/play_again';
  const PlayAgainScreen({super.key});

  @override
  State<PlayAgainScreen> createState() => _PlayAgainScreenState();
}

class _PlayAgainScreenState extends State<PlayAgainScreen> {
  final TextEditingController _nameController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
            // CustomButton(onTap: () {}, text: 'Create Room'),
            // const SizedBox(height: 20),
            // CustomButton(onTap: () {}, text: 'Join Room'),


            SizedBox(height: size.height * 0.08),
            CustomTextField(
                controller: _nameController, hintText: 'Enter your nickname'),
            SizedBox(height: size.height * 0.04),
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
                  dropdownColor: dropdownColor,
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
            CustomButton(onTap: () {}, text: 'Enter Room'),
                ],
              ),
          ),
        ));
  }
}