import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/premium/widgets/price_premium.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';
import 'package:movie_app/pages/summary/widgets/method_summary.dart';
import 'package:movie_app/pages/summary/widgets/price_summary.dart';
import 'package:movie_app/widgets/appbar_pay.dart';
import 'package:movie_app/widgets/button_widgets.dart';

class SummaryPages extends StatelessWidget {
  const SummaryPages({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final double amount =
        double.tryParse(args['textPrice'].replaceAll('\$', '')) ?? 0.0;
    const double tax = 1.99;
    final double total = amount + tax;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppbarPay(title: 'Review Summary'),
                const SizedBox(
                  height: 24,
                ),
                PricePremium(
                  textPrice: args['textPrice'],
                  textDate: args['textDate'],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      PriceSummary(
                        text: 'Amount',
                        price: args['textPrice'],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const PriceSummary(
                        text: 'Tax',
                        price: '\$1.99',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SearchLine(),
                      const SizedBox(
                        height: 24,
                      ),
                      PriceSummary(
                        text: 'Total',
                        price: '\$${total.toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                MethodSummary(
                  logo: args['paymentLogo'],
                  title: args['paymentTitle'],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorApp.borderColor,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/success.png'),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'Congratulations!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: ColorApp.platformColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'You have successfully subscribed 1 ${args['textDate']} premium. Enjoy the benefits!',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ColorApp.textColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutersName.rootsPages);
                                  },
                                  child: const ButtonWidgets(
                                    buttonText: 'OK',
                                    color: ColorApp.platformColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const ButtonWidgets(
                    buttonText: 'Confirm Payment',
                    color: ColorApp.platformColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
