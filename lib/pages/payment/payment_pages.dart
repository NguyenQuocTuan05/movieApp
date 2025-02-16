import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/payment/widgets/choose_payment.dart';
import 'package:movie_app/widgets/appbar_pay.dart';
import 'package:movie_app/widgets/button_widgets.dart';

class PaymentPages extends StatefulWidget {
  const PaymentPages({super.key});

  @override
  State<PaymentPages> createState() => _PaymentPagesState();
}

class _PaymentPagesState extends State<PaymentPages> {
  int selectedOption = 1;
  void _handleRadioValueChange(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  List<Map<String, dynamic>> paymentMethods = [
    {'title': 'PayPal', 'logo': 'assets/images/paypal.png', 'value': 1},
    {'title': 'Google Pay', 'logo': 'assets/images/google.png', 'value': 2},
    {'title': 'Apple Pay', 'logo': 'assets/images/apple.png', 'value': 3},
  ];
  void _addNewPaymentMethod(String title, String logo) {
    setState(() {
      int newValue = paymentMethods.length + 1;
      paymentMethods.add({'title': title, 'logo': logo, 'value': newValue});
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    final textPrice = args['textPrice'];
    final textDate = args['textDate'];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarPay(title: 'Payment'),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Select the payment method you want to use.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: paymentMethods.map((method) {
                    return Column(
                      children: [
                        ChoosePayment(
                          title: method['title'],
                          logo: method['logo'],
                          value: method['value'],
                          groupValue: selectedOption,
                          onChanged: _handleRadioValueChange,
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  }).toList(),
                ),
                GestureDetector(
                  onTap: () async {
                    final newMethod = await Navigator.pushNamed(
                      context,
                      RoutersName.cardPages,
                      arguments: {
                        'textPrice': textPrice,
                        'textDate': textDate,
                      },
                    );
                    if (newMethod is Map<String, String>) {
                      _addNewPaymentMethod(
                          newMethod['title']!, newMethod['logo']!);
                    }
                  },
                  child: const ButtonWidgets(
                      buttonText: 'Add New Card', color: ColorApp.borderColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                GestureDetector(
                  onTap: () {
                    final selectedMethod = paymentMethods.firstWhere(
                      (method) => method['value'] == selectedOption,
                      orElse: () => {},
                    );

                    if (selectedMethod.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        RoutersName.summaryPages,
                        arguments: {
                          'textPrice': textPrice,
                          'textDate': textDate,
                          'paymentTitle': selectedMethod['title'],
                          'paymentLogo': selectedMethod['logo'],
                        },
                      );
                    }
                  },
                  child: const ButtonWidgets(
                      buttonText: 'Continue', color: ColorApp.platformColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
