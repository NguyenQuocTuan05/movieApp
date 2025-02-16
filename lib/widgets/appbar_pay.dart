import 'package:flutter/material.dart';

class AppbarPay extends StatelessWidget {
  const AppbarPay({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 28,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
