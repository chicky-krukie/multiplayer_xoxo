import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/responsive/responsive.dart';
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
              CustomTextField(controller: _nameController, hintText: 'Enter your nickname'),
              const SizedBox(height: 20),
              CustomTextField(controller: _roomIDController, hintText: 'Enter Room ID'),
              SizedBox(height: size.height * 0.045),
              CustomButton(onTap: () {}, text: 'Join')
            ]
          ),
        )
      )
    );
  }
}
