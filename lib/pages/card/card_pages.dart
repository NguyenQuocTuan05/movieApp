import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/card/widgets/cvv_card.dart';
import 'package:movie_app/pages/card/widgets/date_card.dart';
import 'package:movie_app/pages/card/widgets/textfiled_card.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';
import 'package:movie_app/widgets/appbar_pay.dart';
import 'package:movie_app/widgets/button_widgets.dart';

class CardPages extends StatefulWidget {
  const CardPages({super.key});

  @override
  State<CardPages> createState() => _CardPagesState();
}

class _CardPagesState extends State<CardPages> {
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  void _validateAndAddCard() {
    if (_cardNameController.text.isEmpty ||
        _cardNumberController.text.isEmpty ||
        _expiryDateController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill in all information!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_cardNumberController.text.length != 16) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Card number must have exactly 16 digits!',
            style: TextStyle(color: ColorApp.textColor),
          ),
          backgroundColor: ColorApp.errorColor,
        ),
      );
      return;
    }
    if (_cvvController.text.length != 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'CVV must have exactly 3 digits!',
            style: TextStyle(color: ColorApp.textColor),
          ),
          backgroundColor: ColorApp.errorColor,
        ),
      );
      return;
    }
    String maskedCardNumber =
        '**** **** **** ${_cardNumberController.text.substring(12)}';
    Navigator.pop(context, {
      'title': maskedCardNumber,
      'logo': 'assets/images/mastercard.png',
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final textPrice = args['textPrice'];
    final textDate = args['textDate'];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppbarPay(title: 'Add New Card'),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/card.svg',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SearchLine(),
                const SizedBox(
                  height: 24,
                ),
                TextfiledCard(
                  text: 'Card Name',
                  controller: _cardNameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextfiledCard(
                  text: 'Card Number',
                  controller: _cardNumberController,
                  isCardNumber: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateCard(
                        controller: _expiryDateController,
                        onDateSelected: (date) {
                          _expiryDateController.text =
                              "${date.day}/${date.month}/${date.year}";
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CvvCard(
                        controller: _cvvController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                GestureDetector(
                  onTap: () => _validateAndAddCard(),
                  child: const ButtonWidgets(
                    buttonText: 'Add',
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
