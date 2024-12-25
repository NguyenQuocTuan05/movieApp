import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class RegisterSocial extends StatelessWidget {
  const RegisterSocial({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorApp.borderColor,
              ),
              borderRadius: BorderRadius.circular(16),
              color: ColorApp.textfieldColor,
            ),
            child: Image.asset(
              'assets/images/facebook.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorApp.borderColor,
              ),
              borderRadius: BorderRadius.circular(16),
              color: ColorApp.textfieldColor,
            ),
            child: Image.asset(
              'assets/images/google.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorApp.borderColor,
              ),
              borderRadius: BorderRadius.circular(16),
              color: ColorApp.textfieldColor,
            ),
            child: Image.asset(
              'assets/images/apple.png',
            ),
          ),
        ],
      ),
    );
  }
}
