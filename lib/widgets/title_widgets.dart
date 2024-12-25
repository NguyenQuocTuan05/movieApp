import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({
    super.key,
    required this.borderColor,
    required this.imagePath,
    required this.text,
    required this.textColor,
  });
  final Color borderColor; // Màu viền
  final String imagePath; // Đường dẫn hình ảnh
  final String text; // Văn bản
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
