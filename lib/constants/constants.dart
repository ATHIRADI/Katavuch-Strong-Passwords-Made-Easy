import 'package:flutter/material.dart';

class KatavuchColors {
  // colors
  static Color primaryColor = const Color(0xFF1B161E);
  static Color secoundaryColor = const Color(0xFF225560);
  static Color whiteColor = const Color(0xFFD9D9D9);
  static Color brownColor = const Color(0xFF310D20);
  static Color extraColor = const Color(0xFFF0803C);
  static Color transparentColor = Colors.transparent;
  static LinearGradient gradientColor = const LinearGradient(
    colors: [
      Color(0xFF1B161E),
      Color(0xFF225560),
    ],
    begin: Alignment(1, -1),
    end: Alignment(-1, 1),
  );
}

class KatavuchStrings {
  // splash screen
  static String splashTitle = "KATAVUCH";
  static String splashSubTitle = "Password Generator";

  //password screen
  static String homeTitle = "KATAVUCH";
  static String homePasswordTitle = "Generated Password";
  static String homePasswordStrength = "Strong";
  static String homeLengthTitle = "Length";
  static String homeSettingsTitle = "Settings";
  static String homeSettingsOptionUppercase = "Uppercase";
  static String homeSettingsOptionLowercase = "Lowercase";
  static String homeSettingsOptionSymbols = "Symbols";
  static String homeSettingsOptionNumbers = "Numbers";
  static String homeSettingsOptionSpace = "Spaces";
  static String homeSettingsOptionDuplicate = "Exclude Duplicate";
  static String homePasswordGenerateBtn = "Generate Password";
  static String homePasswordGenerateResetBtn = "Reset";

  //history screen
  static String copiedPasswordTitle = "Saved Passwords";
  static String copiedPasswordClearBtn = "Clear All";

  //Drawer screen
  static String appVersion = "Version 1.0.0";
  static String privacyPolicy = "Privacy Policy";
  static String shareApp = "Share";
}
