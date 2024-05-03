import 'package:flutter/material.dart';
import 'package:katavuch/constants/constants.dart';

ThemeData katavuchTheme = ThemeData(
  fontFamily: "Sanchez",
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: KatavuchColors.extraColor,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    bodyLarge: TextStyle(
      color: KatavuchColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: KatavuchColors.extraColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: KatavuchColors.whiteColor,
      fontSize: 12,
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: KatavuchColors.brownColor,
    inactiveTrackColor: KatavuchColors.secoundaryColor,
    thumbColor: KatavuchColors.extraColor,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all<Color>(KatavuchColors.extraColor),
    fillColor: WidgetStateProperty.all<Color>(KatavuchColors.brownColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: KatavuchColors.primaryColor,
      backgroundColor: KatavuchColors.whiteColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: KatavuchColors.brownColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: KatavuchColors.brownColor,
    unselectedItemColor: KatavuchColors.secoundaryColor,
    selectedItemColor: KatavuchColors.extraColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: KatavuchColors.extraColor,
    foregroundColor: KatavuchColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);
