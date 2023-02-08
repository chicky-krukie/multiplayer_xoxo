import 'package:flutter/material.dart';
import 'package:multiplayer_xoxo/utils/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String displayValue = 'EXPLICIT';
  List<String> orgList = [
    'EXPLICIT',
    'JEMMA',
    'GEMS',
    'SME',
    'YES',
    'JPIA',
    'JPMAP',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          borderRadius: BorderRadius.circular(15),
          isExpanded: true,
          focusColor: Colors.transparent,
          dropdownColor: dropdownColor,
          underline: const SizedBox(),
          value: displayValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: orgList.map((String orgList) {
            return DropdownMenuItem(
              value: orgList,
              child: Text(orgList),
            );
          }).toList(),
          onChanged: (String? selectedValue) {
            setState(() {
              displayValue = selectedValue!;
            });
          }),
    );
  }
}
