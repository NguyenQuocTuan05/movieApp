import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ChoosePayment extends StatelessWidget {
  const ChoosePayment({
    super.key,
    required this.title,
    required this.logo,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String logo;
  final int value;
  final int groupValue;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorApp.borderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(logo),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: ColorApp.textColor,
            ),
          ),
          const Spacer(),
          Radio<int>(
            fillColor: WidgetStateProperty.all(ColorApp.platformColor),
            activeColor: ColorApp.platformColor,
            value: value,
            groupValue: groupValue,
            onChanged: (int? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
