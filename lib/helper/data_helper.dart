import 'package:flutter/material.dart';
import 'package:grade_average_application/model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];
  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static List<String> _allLessonsLetter() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double calculateAverage() {
    double sumLetter = 0;
    double sumCredit = 0;
    for (var element in allAddedLessons) {
      sumLetter += element.letterValue * element.creditValue;
      sumCredit += element.creditValue;
    }
    return sumLetter / sumCredit;
  }

  static double _convertLettertoValue(String letter) {
    switch (letter) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLetterDropdownItem() {
    return _allLessonsLetter()
        .map((e) => DropdownMenuItem(
              value: _convertLettertoValue(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<int> _credits() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> allCreditsDropdownItem() {
    return _credits()
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e.toString()),
            ))
        .toList();
  }
}
