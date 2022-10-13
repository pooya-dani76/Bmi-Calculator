// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  bool isMale = true;
  double heightValue = 175;
  double bmi = 0;
  int weightValue = 65;
  int ageValue = 25;

  void resetValues() {
    isMale = true;
    heightValue = 175;
    weightValue = 65;
    ageValue = 25;
    notifyListeners();
  }

  void increaseWeight() {
    weightValue++;
    notifyListeners();
  }

  void decreaseWeight() {
    if (weightValue > 0) {
      weightValue--;
    }
    notifyListeners();
  }

  void increaseAge() {
    if (ageValue < 130) {
      ageValue++;
    }
    notifyListeners();
  }

  void decreaseAge() {
    if (ageValue > 1) {
      ageValue--;
    }
    notifyListeners();
  }

  void malePressed() {
    isMale = true;
    notifyListeners();
  }

  void femalePressed() {
    isMale = false;
    notifyListeners();
  }

  void setHeight(double height) {
    heightValue = height;
    notifyListeners();
  }

  double get heightMeter => heightValue / 100;

  double _BMI({required double height, required int weight}) =>
      weight / pow(height, 2);

  void calculateBMI() {
    bmi = _BMI(height: heightMeter, weight: weightValue);
    notifyListeners();
  }

  Map status(double BMI) {
    if (BMI < 18.5) {
      return {'text': 'Under Weight', 'color': Colors.blue};
    } else if (BMI >= 18.5 && BMI < 25) {
      return {'text': 'Normal', 'color': Colors.green};
    } else if (BMI >= 25 && BMI < 30) {
      return {'text': 'Over Weight', 'color': Colors.yellow};
    } else if (BMI >= 30 && BMI <= 35) {
      return {'text': 'Fat', 'color': Colors.orange};
    } else if (BMI > 35) {
      return {'text': 'Very Fat', 'color': Colors.red};
    } else {
      return {'text': 'Invalid BMI', 'color': Colors.white};
    }
  }

  int findSuitableWeight() {
    if (bmi >= 25) {
      for (int weight = weightValue; weight > 0; weight--) {
        if (_BMI(height: heightMeter, weight: weight) >= 18.5 &&
            _BMI(height: heightMeter, weight: weight) < 25) {
          return weight;
        }
      }
    } else if (bmi < 18.5) {
      for (int weight = 1; weight < 500; weight++) {
        if (_BMI(height: heightMeter, weight: weight) >= 18.5 &&
            _BMI(height: heightMeter, weight: weight) < 25) {
          return weight;
        }
      }
    }
    return -1;
  }
}
