// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/fuctions.dart';
import 'package:bmi_calculator/View/Screens/saved_results_page.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:bmi_calculator/View/Widgets/ResultScreen/suitable_weight_alert.dart';
import 'package:flutter/material.dart';

class BmiAppBar extends StatelessWidget with PreferredSizeWidget {
  final BuildContext context;
  final bool isResultPage;
  final bool isHistoryPage;
  final String title;
  const BmiAppBar(
      {super.key,
      required this.context,
      required this.isResultPage,
      required this.title,
      required this.isHistoryPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      title: Text(
        title.toUpperCase(),
      ),
      centerTitle: true,
      leading: isHistoryPage
          ? null
          : IconButton(
              icon: Icon(Icons.history_rounded),
              onPressed: () {
                navigateTo(context, SavedResultPage());
              },
            ),
      actions: isResultPage
          ? [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuitableWeightAlert(),
                  );
                },
                icon: Icon(Icons.info_outline_rounded),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 55);
}
