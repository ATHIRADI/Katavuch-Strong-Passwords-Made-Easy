import "dart:convert";
import "dart:math";
import "package:flutter/material.dart";
import "package:katavuch/models/models.dart";
import "package:katavuch/utils/utils.dart";
import "package:shared_preferences/shared_preferences.dart";

class PasswordProvider with ChangeNotifier {
  String password = "", copiedText = "", passwordStrength = "Very Weak";
  int passwordLength = 6;
  bool hasLowerCase = false,
      hasUpperCase = false,
      hasNumber = false,
      hasSpecial = false;
  List<PasswordModel> copiedList = [];

  PasswordProvider() {
    getPasswords();
  }

  void setHasLowerCase(bool value) {
    hasLowerCase = value;
    notifyListeners();
  }

  void setHasUpperCase(bool value) {
    hasUpperCase = value;
    notifyListeners();
  }

  void setHasNumber(bool value) {
    hasNumber = value;
    notifyListeners();
  }

  void setHasSpecial(bool value) {
    hasSpecial = value;
    notifyListeners();
  }

  String generatePassword(context) {
    const String numbers = "0123456789";
    String lowerCase = "abcdefghijklmnopqrstuvwxyz",
        upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        symbols = "!\$%&|[](){}:;.,*+-#@<>~",
        allowedChars = "";

    if (hasLowerCase == false &&
        hasUpperCase == false &&
        hasNumber == false &&
        hasSpecial == false) {
      return showSnackBar(context, 'Please select one of the checkboxes');
    }

    if (hasLowerCase) allowedChars += lowerCase;
    if (hasUpperCase) allowedChars += upperCase;
    if (hasNumber) allowedChars += numbers;
    if (hasSpecial) allowedChars += symbols;

    if (allowedChars.isEmpty) {
      password = "";
      passwordStrength = "Very Weak";
      notifyListeners();
      return password;
    }

    Random rand = Random.secure();
    password = List.generate(passwordLength,
        (_) => allowedChars[rand.nextInt(allowedChars.length)]).join("");
    checkPasswordStrength();
    notifyListeners();
    return password;
  }

  void checkPasswordStrength() {
    bool hasAllCharacterTypes =
        hasLowerCase && hasUpperCase && hasNumber && hasSpecial;
    int lengthScore = passwordLength >= 32
        ? 2
        : passwordLength > 16
            ? 1
            : 0;

    if (hasAllCharacterTypes) {
      switch (lengthScore) {
        case 2:
          passwordStrength = "Strong";
          break;
        case 1:
          passwordStrength = "Good";
          break;
        default:
          passwordStrength = "Weak";
          break;
      }
    } else {
      switch (lengthScore) {
        case 2:
          passwordStrength = "Good";
          break;
        case 1:
          passwordStrength = "Weak";
          break;
        default:
          passwordStrength = "Very Weak";
          break;
      }
    }
  }

  void passwordReset() {
    hasLowerCase = false;
    hasUpperCase = false;
    hasNumber = false;
    hasSpecial = false;
    passwordLength = 6;
    password = "";
    passwordStrength = "Very Weak";
    notifyListeners();
  }

  void passwordCopied(String newPassword) async {
    final prefs = await SharedPreferences.getInstance();

    final map = {
      "id": DateTime.now().microsecondsSinceEpoch,
      "password": newPassword,
    };

    if (newPassword.isNotEmpty &&
        (copiedList.isEmpty || newPassword != copiedList.last.password)) {
      copiedList.add(
        PasswordModel.fromMap(map),
      );
      await prefs.setStringList(
        "copiedList",
        copiedList.map((e) => jsonEncode(e.toMap())).toList(),
      );
      copiedText = newPassword;
      getPasswords();
      notifyListeners();
    }
  }

  Future<List<PasswordModel>> getPasswords() async {
    final prefs = await SharedPreferences.getInstance();

    final decodeList = prefs.getStringList('copiedList') ?? [];
    try {
      copiedList = decodeList
          .map((e) =>
              PasswordModel.fromMap(jsonDecode(e) as Map<String, dynamic>))
          .toList();
      return copiedList;
    } catch (error) {
      return [];
    }
  }

  void clearCopies() async {
    final prefs = await SharedPreferences.getInstance();

    copiedList.clear();
    await prefs.setStringList("copiedList", []);
    notifyListeners();
  }

  Future<void> deletePassword(int id) async {
    final prefs = await SharedPreferences.getInstance();

    copiedList.removeWhere((passwordModel) => passwordModel.id == id);
    await prefs.setStringList(
      "copiedList",
      copiedList
          .map((passwordModel) => jsonEncode(passwordModel.toMap()))
          .toList(),
    );
    notifyListeners();
  }
}
