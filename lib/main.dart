import 'package:flutter/material.dart';
import 'package:grade_average_application/constants/app_constants.dart';

import 'calculate_avarage_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Average',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const CalculateAvaragePage(),
    );
  }
}
