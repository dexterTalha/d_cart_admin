import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isObscure = true;
  bool _isChecked = false;
  bool get obscure => _isObscure;
  bool get checked => _isChecked;
  bool isLoading = false;
  User? currentUser;

  toggleObscure() {
    _isObscure = !_isObscure;
    print(_isObscure);
    notifyListeners();
  }

  toggleCheck(bool checked) {
    _isChecked = checked;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
      currentUser = credential.user;
      isLoading = false;
      notifyListeners();
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email') {
        print("invalid email");
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  bool getLoggedInUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
