import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/flushbar_message.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlushbarMessage _flushbar = FlushbarMessage();

  String? emailError;
  String? passwordError;

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      emailError = "Please enter your email";
    } else if (!isValidEmail(email)) {
      emailError = "Invalid email format!";
    } else {
      emailError = null;
    }

    if (password.isEmpty) {
      passwordError = "Please enter your password";
    } else if (password.length < 6) {
      passwordError = "Password must be at least 6 characters long";
    } else {
      passwordError = null;
    }

    notifyListeners();

    if (emailError != null || passwordError != null) {
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _flushbar.show(context, 'Registration successful!');
      context.read<HomeProvider>().addNotification('Registration successful!');
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Registration failed!";
      if (e.code == 'weak-password') {
        errorMessage = "The password is too weak!";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already in use!";
      }
      _flushbar.show(context, errorMessage);
    }
  }

  void resetForm() {
    emailController.clear();
    passwordController.clear();
    emailError = null;
    passwordError = null;
    notifyListeners();
  }
}
