import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextStyleSheets {
  static TextStyle get title => GoogleFonts.nunitoSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subtitle => GoogleFonts.nunitoSans(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get body => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get button => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get list => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
}