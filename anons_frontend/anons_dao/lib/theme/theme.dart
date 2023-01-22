import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';

class AnonsTheme {
  static const primaryDark = Color(0xff393E46);
  static const secondaryDark = Color(0xff474A56);
  static const backgroundColor = Color(0xFF1D1D1D);
  static const highlightColor = Color(0xffCAE4DB);
  static const orange = Color(0xFFF96761);
  static const yellow = Color(0xFFFCFBA6);
  static const pink = Color(0xFFFBA3FF);
  static const blue = Color(0xFF63FEFF);
  static const green = Color(0xFF42F903);
  static const textColor = Color(0xffCAE4DB);

  static var anonsDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    primaryColorDark: primaryDark,
    primarySwatch: generateMaterialColor(color: secondaryDark),
    scaffoldBackgroundColor: secondaryDark,
    textTheme: TextTheme(
      bodyText1: GoogleFonts.vt323(
        fontSize: 12,
        color: textColor,
      ),
      bodyText2: GoogleFonts.vt323(
        fontSize: 18,
        color: textColor,
      ),
      headline1: GoogleFonts.vt323(
        fontSize: 22,
        color: textColor,
      ),
      headline2: GoogleFonts.rubikGlitch(
        fontSize: 24,
        color: textColor,
      ),
      headline3: GoogleFonts.vt323(
        fontSize: 32,
        color: textColor,
      ),
      headline4: GoogleFonts.vt323(
        fontSize: 32,
        color: textColor,
      ),
      headline5: GoogleFonts.vt323(
        fontSize: 48,
        color: textColor,
      ),
      headline6: GoogleFonts.vt323(
        fontSize: 48,
        color: textColor,
      ),
      button: GoogleFonts.vt323(
        fontSize: 22,
        color: textColor,
      ),
    ),
  );

  // List<Color> ghostColors = const [
  //   Color(0xffCF93EF),
  //   Color(0xffFFC9C3),
  //   Color(0xffF8B571),
  //   Color(0xffE5FEBC),
  //   Color(0xff5EF9F4),
  //   Color(0xff5DF9F4),
  //   Color(0xffFFB6C6),
  //   Color(0xffFEE780),
  //   Color(0xffF7A4F6),
  //   Color(0xff28B588),
  //   Color(0xffCF93EF),
  //   Color(0xff6F7CED),
  //   Color(0xff8AF8B8),
  //   Color(0xffC689E9),
  //   Color(0xffE4FDBC),
  //   Color(0xff5EF9F4),
  //   Color(0xffEF5A24),
  //   Color(0xffFEE780),
  //   Color(0xffE5FEBC),
  //   Color(0xffFF826C),
  //   Color(0xffF7A4F6),
  //   Color(0xffB4FFC8),
  //   Color(0xffFEC2BC),
  //   Color(0xffF8B571),
  //   Color(0xffE5FEBC),
  //   Color(0xffF1742A),
  //   Color(0xff7CDFA6),
  //   Color(0xffFBD597),
  //   Color(0xffFDD900),
  //   Color(0xffB4FFC8),
  //   Color(0xff9CDAF6),
  //   Color(0xffE5FEBC),
  //   Color(0xffFF7A2A),
  //   Color(0xffFFA4A0),
  //   Color(0xffEB1F79),
  //   Color(0xff5EF9F4),
  //   Color(0xffCF93EF),
  //   Color(0xffFFC8C2),
  // ];
}
