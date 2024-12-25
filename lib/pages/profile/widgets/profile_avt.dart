import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/widgets/avt_widgets.dart';

class ProfileAvt extends StatelessWidget {
  const ProfileAvt({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          AvtWidgets(),
          SizedBox(height: 8),
          Text(
            'Andrew Ainsley',
            style: TextStyle(
                color: ColorApp.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'andrew_ainsley@yourdomain.com',
            style: TextStyle(color: ColorApp.textColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
