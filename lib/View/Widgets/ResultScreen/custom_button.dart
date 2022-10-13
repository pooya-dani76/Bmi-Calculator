// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Size size;
  final Color color;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.color),
        fixedSize: MaterialStateProperty.all(widget.size),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
