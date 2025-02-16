import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/premium/widgets/price_premium.dart';

class PremiumPages extends StatelessWidget {
  const PremiumPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Text(
                'Subscribe to Premium',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.platformColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enjoy watching Full-HD movies, without\nrestrictions and without ads',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutersName.paymentPages,
                    arguments: {
                      'textPrice': '\$9.99',
                      'textDate': ' month',
                    },
                  );
                },
                child: const PricePremium(
                  textPrice: '\$9.99',
                  textDate: ' month',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutersName.paymentPages,
                    arguments: {
                      'textPrice': '\$99.99',
                      'textDate': ' year',
                    },
                  );
                },
                child: const PricePremium(
                  textPrice: '\$99.99',
                  textDate: ' year',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
