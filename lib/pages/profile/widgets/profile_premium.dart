import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ProfilePremium extends StatelessWidget {
  const ProfilePremium({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: ColorApp.platformColor, width: 2),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Vector.png'),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join Premium!',
                  style: TextStyle(
                      color: ColorApp.platformColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Enjoy watching Full-HD movies, without restrictions and without ads',
                  style: TextStyle(color: ColorApp.textColor, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: ColorApp.platformColor),
        ],
      ),
    );
  }
}
