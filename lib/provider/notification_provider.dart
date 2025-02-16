import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  List<Map<String, dynamic>> notificationOptions = [
    {'title': 'General Notification', 'value': true},
    {'title': 'New Arrival', 'value': false},
    {'title': 'New Services Available', 'value': false},
    {'title': 'New Releases Movie', 'value': true},
    {'title': 'App Updates', 'value': true},
    {'title': 'Subscription', 'value': true},
  ];
  void toggleNotification(int index) {
    notificationOptions[index]['value'] = !notificationOptions[index]['value'];
    notifyListeners();
  }
}
