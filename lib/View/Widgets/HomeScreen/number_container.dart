// ignore_for_file: prefer_const_literals_to_create_immutables,
// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/View/Widgets/HomeScreen/number_control_container.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberContainer extends StatefulWidget {
  final bool isAge;
  const NumberContainer({super.key, required this.isAge});

  @override
  State<NumberContainer> createState() => _NumberContainerState();
}

class _NumberContainerState extends State<NumberContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.isAge ? 'age'.toUpperCase() : 'weight'.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.isAge
                  ? value.ageValue.toString()
                  : value.weightValue.toString(),
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberControlButton(
                    text: '-',
                    onTap: () {
                      if (widget.isAge) {
                        value.decreaseAge();
                      } else {
                        value.decreaseWeight();
                      }
                    },
                  ),
                  NumberControlButton(
                    text: '+',
                    onTap: () {
                      if (widget.isAge) {
                        value.increaseAge();
                      } else {
                        value.increaseWeight();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
