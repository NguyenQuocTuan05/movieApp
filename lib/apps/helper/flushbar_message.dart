import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class FlushbarMessage {
  void show(BuildContext context, String? message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: ColorApp.platformColor,
      messageColor: ColorApp.textColor,
    ).show(context);
  }
}
