// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final bool isSelected;
  final String gender;
  final VoidCallback onTap;
  const GenderBox(
      {super.key,
      required this.isSelected,
      required this.gender,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(gender == 'male' ? 0 : 45 / 360),
              child: Icon(
                gender == 'male' ? Icons.male : Icons.female,
                size: 90,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              gender.toUpperCase(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
