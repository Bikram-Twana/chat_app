import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isPasswordVisible = false;

  void changeVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
