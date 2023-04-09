import 'package:flutter/widgets.dart';
import 'package:grade_average_application/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double avarage;
  final int lessonNumber;
  const ShowAverage(
      {required this.avarage, required this.lessonNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonNumber > 0 ? "$lessonNumber Course Selected" : "Select Course",
          style: Constants.lessonTextStyle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            avarage >= 0 ? avarage.toStringAsFixed(2) : '0,0',
            style: Constants.avarageTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          "Average",
          style: Constants.lessonTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
