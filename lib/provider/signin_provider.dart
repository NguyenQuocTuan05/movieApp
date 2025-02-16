import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/flushbar_message.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlushbarMessage _flushbar = FlushbarMessage();

  String? emailError;
  String? passwordError;

  bool rememberMe = false;
  SigninProvider() {
    _loadRememberMe();
  }

  void toggleRememberMe(bool signIn) async {
    if (signIn) {
      rememberMe = !rememberMe;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('rememberMe', rememberMe);

      if (!rememberMe) {
        await prefs.remove('savedEmail');
        await prefs.remove('savedPassword');
      }
    }
  }

  Future<void> _loadRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('rememberMe') ?? false;

    if (rememberMe) {
      emailController.text = prefs.getString('savedEmail') ?? "";
      passwordController.text = prefs.getString('savedPassword') ?? "";
    } else {
      emailController.text = "";
      passwordController.text = "";
    }

    notifyListeners();
  }

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

  Future<void> login(BuildContext context) async {
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
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        _flushbar.show(context, 'Login successful by Email !');
        context
            .read<HomeProvider>()
            .addNotification('Login successful by Email !');
        if (rememberMe) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('savedEmail', email);
          await prefs.setString('savedPassword', password);
        }
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, RoutersName.rootsPages);
        });
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Login failed!";
      if (e.code == 'user-not-found') {
        errorMessage = "No account found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }
      _flushbar.show(context, errorMessage);
    }
  }
}
