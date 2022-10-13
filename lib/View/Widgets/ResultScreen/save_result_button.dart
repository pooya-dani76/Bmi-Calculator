// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/get_name_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveResultButton extends StatelessWidget {
  const SaveResultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Material(
        borderRadius: BorderRadius.circular(20),
        color: inContainerColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => GetNameAlert(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Save Result'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
