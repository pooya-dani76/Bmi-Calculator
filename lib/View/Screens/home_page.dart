// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/fuctions.dart';
import 'package:bmi_calculator/Models/bmi.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/View/Screens/result_screen.dart';
import 'package:bmi_calculator/View/Widgets/Common/app_bar.dart';
import 'package:bmi_calculator/View/Widgets/Common/calculate_button.dart';
import 'package:bmi_calculator/View/Widgets/HomeScreen/gender_box.dart';
import 'package:bmi_calculator/View/Widgets/HomeScreen/height_slider_box.dart';
import 'package:bmi_calculator/View/Widgets/HomeScreen/number_container.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Future<void> dispose() async {
    Box<PersonBmi> box = Hive.box('bmi');
    await box.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BmiAppBar(
          title: 'BMI Calculator',
          context: context,
          isResultPage: false,
          isHistoryPage: false,
        ),
        body: Consumer<AppData>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 16,
                        child: Row(
                          children: [
                            Expanded(
                              child: GenderBox(
                                gender: 'male',
                                isSelected: value.isMale,
                                onTap: () => value.malePressed(),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: GenderBox(
                                gender: 'female',
                                isSelected: !value.isMale,
                                onTap: () => value.femalePressed(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 19,
                        child: HeightSliderBox(),
                      ),
                      Expanded(
                        flex: 17,
                        child: Row(
                          children: [
                            Expanded(child: NumberContainer(isAge: false)),
                            SizedBox(width: 10),
                            Expanded(child: NumberContainer(isAge: true)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CalculateButton(
                text: 'calculate your bmi',
                onTap: () {
                  value.calculateBMI();
                  navigateTo(context, ResultPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
