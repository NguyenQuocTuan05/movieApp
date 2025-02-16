import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class TextfiledCard extends StatelessWidget {
  const TextfiledCard(
      {super.key,
      required this.text,
      required this.controller,
      this.isCardNumber = false});
  final String text;
  final TextEditingController controller;
  final bool isCardNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TextField(
          controller: controller,
          inputFormatters: isCardNumber
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ]
              : [],
          keyboardType: isCardNumber
              ? const TextInputType.numberWithOptions()
              : TextInputType.text,
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
