// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Controller/constants.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final VoidCallback onPressedYes;
  final VoidCallback onPressedNo;
  const CustomAlert(
      {super.key, required this.onPressedYes, required this.onPressedNo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: kBackgroundColor,
      title: Text(
        'Would You Like Reset All Parameters?',
        style: TextStyle(color: Colors.white),
      ),
      content: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Yes',
              size: Size(90, 50),
              color: Colors.green,
              onPressed: onPressedYes,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: CustomButton(
              text: 'No',
              size: Size(90, 50),
              color: Colors.red,
              onPressed: onPressedNo,
            ),
          ),
        ],
      ),
    );
  }
}
