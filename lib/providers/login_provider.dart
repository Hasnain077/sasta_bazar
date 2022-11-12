import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isObscure = true;
  bool _isChecked = false;

  bool get obscure => _isObscure;

  bool get checked => _isChecked;
  bool isLoading = false;

  toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  toggleCheckBox(bool checked) {
    _isChecked = checked;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3), () {});
    isLoading = false;
    notifyListeners();
    return false;

    // why return
  }
}
