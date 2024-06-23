import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
);
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.deepPurple,
);

final ThemeData darkAppTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.primary,
    titleTextStyle: GoogleFonts.rubik().copyWith(
      color: kDarkColorScheme.onPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
    ),
  ),
  cardTheme: const CardTheme().copyWith(
    margin: const EdgeInsets.all(5),
  ),
);

final ThemeData appTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.rubikTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.primary,
    titleTextStyle: GoogleFonts.rubik().copyWith(
      color: kColorScheme.onPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
    ),
  ),
  cardTheme: const CardTheme().copyWith(
    margin: const EdgeInsets.all(5),
  ),
);
