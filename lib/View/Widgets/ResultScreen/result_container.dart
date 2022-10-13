// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/advices.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/save_result_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value.status(value.bmi)['text'],
              style: TextStyle(
                color: value.status(value.bmi)['color'],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.bmi.toStringAsFixed(1),
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Text(
                  'Normal BMI Range:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '18.5 - 25 kg/m2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              advices[value.status(value.bmi)['text'].toLowerCase()]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SaveResultButton(),
          ],
        ),
      ),
    );
  }
}
