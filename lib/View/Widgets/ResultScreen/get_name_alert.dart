// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/fuctions.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetNameAlert extends StatelessWidget {
  GetNameAlert({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: kBackgroundColor,
        title: Text(
          'Enter Your Name',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              maxLines: 1,
              maxLength: 20,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'OK',
              size: Size(90, 50),
              color: inContainerColor,
              onPressed: () => saveBmiInfo(context, controller),
            )
          ],
        ),
      ),
    );
  }
}
