import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class RegisterDetails extends StatelessWidget {
  const RegisterDetails({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        image,
      ),
    );
  }
}
