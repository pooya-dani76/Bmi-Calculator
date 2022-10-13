import 'package:hive/hive.dart';

part 'bmi.g.dart';

@HiveType(typeId: 1)
class PersonBmi {
  @HiveField(0)
  double bmi;

  @HiveField(1)
  int idealWeight;

  @HiveField(2)
  String gender;

  @HiveField(3)
  int height;

  @HiveField(4)
  int weight;

  @HiveField(5)
  int age;

  @HiveField(6)
  DateTime time;

  @HiveField(7)
  String name;

  PersonBmi(
      {required this.bmi,
      required this.idealWeight,
      required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.time,
      required this.name});
}
