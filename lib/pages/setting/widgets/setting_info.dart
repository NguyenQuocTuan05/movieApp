import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingInfo extends StatelessWidget {
  const SettingInfo({super.key, required this.text, required this.fieldType});

  final String text;
  final String fieldType;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, provider, child) {
        return TextField(
          onChanged: (value) {
            if (fieldType == 'firstName') {
              provider.setFirstName(value);
            } else if (fieldType == 'lastName') {
              provider.setLastName(value);
            } else if (fieldType == 'email') {
              provider.setEmail(value);
            }
          },
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: ColorApp.borderColor),
            labelStyle:
                const TextStyle(color: ColorApp.textColor, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorApp.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorApp.borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: ColorApp.backgroundColor_dark,
            suffixIcon: fieldType == 'email'
                ? const Icon(Icons.email, color: ColorApp.textColor)
                : null,
          ),
          keyboardType: fieldType == 'email'
              ? TextInputType.emailAddress
              : TextInputType.text,
          style: const TextStyle(color: ColorApp.textColor),
          cursorColor: ColorApp.platformColor,
        );
      },
    );
  }
}
