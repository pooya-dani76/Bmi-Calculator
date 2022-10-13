// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';

class NumberControlButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const NumberControlButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<NumberControlButton> createState() => _NumberControlButtonState();
}

class _NumberControlButtonState extends State<NumberControlButton> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (detail) {
        timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
        widget.onTap();
        });
      },
      onLongPressEnd: (details) {
        timer!.cancel();
      },
      onTap: widget.onTap,
      child: CircleAvatar(
        backgroundColor: inContainerColor,
        radius: 27,
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
