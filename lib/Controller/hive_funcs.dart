import 'package:bmi_calculator/Models/bmi.dart';
import 'package:hive/hive.dart';

Future<void> addToHive(PersonBmi personBmi) async {
  Box<PersonBmi> box = Hive.box('bmi');
  await box.add(personBmi);
}

Future<void> deleteFromHive(int index) async {
  Box<PersonBmi> box = Hive.box('bmi');
  await box.deleteAt(index);
}
