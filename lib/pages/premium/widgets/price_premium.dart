import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/premium/widgets/privileges_premium.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';

class PricePremium extends StatelessWidget {
  const PricePremium(
      {super.key, required this.textPrice, required this.textDate});
  final String textPrice;
  final String textDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: ColorApp.platformColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/Vector.png'),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textPrice,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '/',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyLarge?.color),
              ),
              Text(
                textDate,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const SearchLine(),
          const PrivilegesPremium(
            title: 'Watch all you want. Ad-free.',
          ),
          const PrivilegesPremium(
            title: 'Allows streaming of 4K.',
          ),
          const PrivilegesPremium(
            title: 'Video & Audio Quality is Better.',
          ),
        ],
      ),
    );
  }
}
