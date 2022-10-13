import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CalculateButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kPink)),
        onPressed: onTap,
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
