import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class CvvCard extends StatelessWidget {
  const CvvCard({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CVV',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            fillColor: ColorApp.borderColor,
            hintStyle: const TextStyle(
              color: ColorApp.borderColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorApp.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorApp.borderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
