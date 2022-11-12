import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isObscure = true;
  bool get obscure => _isObscure;
  bool isLoading = false;
  bool isChecked = true;
  bool get Checkbox => isChecked;

  toggleObscure(){
    _isObscure = !_isObscure;
    notifyListeners();

  }
  toggleCheckBox(){
    isChecked = !isChecked;
   notifyListeners();
  }

Future<bool> login(String username, String password) async{
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3), (){});
    isLoading = false;
    notifyListeners();
    return false;

    // why return
}
}