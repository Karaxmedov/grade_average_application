import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.deepPurple;
  static const titleText = "Calculate Avarage";
  static final TextStyle textStyle = GoogleFonts.merriweather(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );
  static final TextStyle lessonTextStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final TextStyle avarageTextStyle = GoogleFonts.roboto(
    fontSize: 50,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );
  static const dropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static BorderRadius borderRadius = BorderRadius.circular(20);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: 8.0);
}
