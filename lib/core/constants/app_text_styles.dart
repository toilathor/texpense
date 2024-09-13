import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 28 / 22,
    wordSpacing: 0.5,
  );

  static TextStyle h6 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 24 / 20,
  );

  static TextStyle titleBold = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 24 / 20,
  );

  static TextStyle subTitle1 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static TextStyle subTitle2 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );

  static TextStyle body2 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 16 / 10,
  );

  static TextStyle labelButton = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 16 / 14,
  );
}
