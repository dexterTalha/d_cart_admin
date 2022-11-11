import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isObscure = true;

  bool get obscure => _isObscure;
  bool isLoading = false;

  toggleObscure() {
    _isObscure = !_isObscure;
    print(_isObscure);
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3), () {});
    isLoading = false;
    notifyListeners();
    //cpdes

    return false;
  }
}
