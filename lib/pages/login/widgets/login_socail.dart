import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class LoginSocail extends StatelessWidget {
  const LoginSocail({
    super.key,
    required this.buttonText,
    required this.imagePath,
  });
  final String imagePath;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorApp.borderColor,
        ),
        borderRadius: BorderRadius.circular(16),
        color: ColorApp.textfieldColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              color: ColorApp.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
