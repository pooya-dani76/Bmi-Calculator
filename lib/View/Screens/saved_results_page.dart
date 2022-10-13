// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Models/bmi.dart';
import 'package:bmi_calculator/View/Widgets/Common/app_bar.dart';
import 'package:bmi_calculator/View/Widgets/HistoryScreen/result_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedResultPage extends StatelessWidget {
  SavedResultPage({super.key});
  final Box<PersonBmi> box = Hive.box('bmi');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmiAppBar(
        title: 'Saved Bmi Result',
        context: context,
        isResultPage: false,
        isHistoryPage: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, value, Widget? child) {
          if (box.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ResultTile(
                  index: index,
                  personBmi: value.getAt(index),
                );
              },
              itemCount: box.length,
            );
          } else {
            return Center(
              child: Text(
                'No Any Saved Result!',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
