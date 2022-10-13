// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Controller/hive_funcs.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

deleteBmiInfo(int index, BuildContext context) {
  deleteFromHive(index).whenComplete(() {
    Fluttertoast.showToast(
      msg: 'Deleted!',
      gravity: ToastGravity.BOTTOM,
    );
  });
}

saveBmiInfo(BuildContext context, controller) async {
  var provider = Provider.of<AppData>(context, listen: false);
  {
    PersonBmi personBmi = PersonBmi(
      name: controller.text,
      height: provider.heightValue.toInt(),
      time: DateTime.now(),
      weight: provider.weightValue,
      idealWeight: provider.findSuitableWeight(),
      age: provider.ageValue,
      bmi: provider.bmi,
      gender: provider.isMale ? 'Male' : 'Female',
    );
    await addToHive(personBmi).whenComplete(() {
      Fluttertoast.showToast(
        msg: 'Saved!',
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }
}
