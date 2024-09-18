import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.soraTextTheme(),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.teal[50],
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.teal),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(Colors.teal),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
);
