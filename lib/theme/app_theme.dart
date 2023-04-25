import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spacing {
  final EdgeInsets screenPadding = const EdgeInsets.all(20);

  const Spacing();
}

class AppColors {
  final MaterialColor primary = const MaterialColor(
    0xffF59E0B,
    <int, Color>{
      50: Color(0xffFFFBEB),
      100: Color(0xffFEF3C7),
      200: Color(0xffFDE68A),
      300: Color(0xffFCD34D),
      400: Color(0xffFBBF24),
      500: Color(0xffed9d17),
      600: Color(0xffD97706),
      700: Color(0xffB45309),
      800: Color(0xff92400E),
      900: Color(0xff78350F),
    },
  );

  final MaterialColor gray = const MaterialColor(
    0xff64748B,
    <int, Color>{
      50: Color(0xffF8FAFC),
      100: Color(0xffF1F5F9),
      200: Color(0xffE2E8F0),
      300: Color(0xffCBD5E1),
      400: Color(0xff94A3B8),
      500: Color(0xff64748B),
      600: Color(0xff475569),
      700: Color(0xff334155),
      800: Color(0xff1E293B),
      900: Color(0xff0F172A),
    },
  );

  final Color textPrimary = Colors.white;
  final Color textSecondary = const Color(0xffCBD5E1);
  final Color textTertiary = const Color(0xff64748B);

  final Color appBackground = const Color(0xff0F172A);
  final Color appBackgroundSecondary = const Color(0xff1D2538);

  const AppColors();
}

class AppTheme {
  static double mainBorderRadiusValue = 10;

  static Spacing spacing = const Spacing();
  static AppColors colors = const AppColors();
  static TextTheme typography = const TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    headline2: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    headline3: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    headline5: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: "Poppins",
    ),
    bodyText1: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xffCBD5E1),
    ),
    bodyText2: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xffCBD5E1),
    ),
    button: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xff94A3B8),
    ),
  ); // TODO

  const AppTheme();
}
