// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'package:bmi_calculator/Models/bmi.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/View/Screens/home_page.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(PersonBmiAdapter());
    Box<PersonBmi> box = await Hive.openBox('bmi');
  } catch (e) {
    print('ErrorS: $e');
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => AppData(),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kBackgroundColor,
      ),
      title: 'bmi calculator',
      home: HomePage(),
    );
  }
}
