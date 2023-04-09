import 'package:flutter/material.dart';

import 'package:grade_average_application/constants/app_constants.dart';
import 'package:grade_average_application/helper/data_helper.dart';
import 'package:grade_average_application/model/lesson.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;

    return allLessons.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (direction) {
                  onDismiss(index);
                },
                direction: DismissDirection.startToEnd,
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLessons[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text((allLessons[index].letterValue *
                                allLessons[index].creditValue)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          " ${allLessons[index].creditValue} credits, ${allLessons[index].letterValue} Grade "),
                    ),
                  ),
                ),
              );
            },
            itemCount: DataHelper.allAddedLessons.length,
          )
        : Center(
            child: Text(
              "Please Enter Course",
              style: Constants.textStyle,
            ),
          );
  }
}
