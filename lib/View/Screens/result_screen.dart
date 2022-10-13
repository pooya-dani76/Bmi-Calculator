// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/View/Widgets/Common/app_bar.dart';
import 'package:bmi_calculator/View/Widgets/Common/calculate_button.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/custom_alert_dailog.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/result_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BmiAppBar(
          title: 'Result',
          context: context,
          isResultPage: true,
          isHistoryPage: false,
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 20,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ResultContainer(),
              ),
              SizedBox(height: 20),
              CalculateButton(
                text: 're-calculate your bmi',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlert(
                      onPressedYes: () {
                        value.resetValues();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      onPressedNo: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
