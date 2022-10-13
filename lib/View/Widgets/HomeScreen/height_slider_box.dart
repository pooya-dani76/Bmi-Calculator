// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightSliderBox extends StatefulWidget {
  const HeightSliderBox({super.key});

  @override
  State<HeightSliderBox> createState() => _HeightSliderBoxState();
}

class _HeightSliderBoxState extends State<HeightSliderBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'height'.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value.heightValue.toInt().toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'cm',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              min: 140,
              max: 220,
              activeColor: Colors.white,
              thumbColor: kPink,
              inactiveColor: Colors.grey,
              value: value.heightValue,
              onChanged: (newValue) => value.setHeight(newValue),
            )
          ],
        ),
      ),
    );
  }
}
