import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SearchLine extends StatelessWidget {
  const SearchLine({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorApp.borderColor,
        ),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
    );
  }
}
