// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/custom_button.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuitableWeightAlert extends StatelessWidget {
  const SuitableWeightAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: kBackgroundColor,
        title: Text(
          'Suitable Weight For You',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70,
              child: Text(
                value.findSuitableWeight() == -1
                    ? 'You Are in Ideal Weight!'
                    : 'Your Ideal Weight : ${value.findSuitableWeight()} kg',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20),
            CustomButton(
              text: 'OK',
              size: Size(90, 50),
              color: inContainerColor,
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
