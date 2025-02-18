import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;

  void setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
}
