import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/pages/register/widgets/register_form.dart';
import 'package:movie_app/pages/register/widgets/register_remember.dart';
import 'package:movie_app/pages/register/widgets/register_social.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/register_provider.dart';
import 'package:movie_app/widgets/button_widgets.dart';
import 'package:movie_app/widgets/choose_widgets.dart';
import 'package:movie_app/widgets/line_widgets.dart';
import 'package:provider/provider.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  void loginCLick() async {
    try {
      bool login = await context.read<RegisterProvider>().login();
      if (login == true) {
        Navigator.pushNamed(context, RoutersName.homePages);
      } else {
        print('login fails');
      }
    } catch (e) {
      print('Error :::: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ColorApp.textColor,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 32,
                  color: ColorApp.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const RegisterForm(labelText: 'Email', prefixIcon: Icons.email),
              const SizedBox(
                height: 20,
              ),
              const RegisterForm(labelText: 'Password', prefixIcon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              RegisterRemember(
                onChanged: (bool newValue) {
                  print('Checkbox Value: $newValue');
                },
                value: false,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, RoutersName.rootsPages);
                  // context.read<RegisterProvider>().login();
                  loginCLick();
                },
                child: const ButtonWidgets(
                  buttonText: 'Sign up',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const LineWidgets(
                text: 'or continue with',
              ),
              const SizedBox(
                height: 25,
              ),
              const RegisterSocial(),
              const SizedBox(
                height: 40,
              ),
              const ChooseWidgets(
                  choose: 'Sign in', question: 'Already have an account?'),
            ],
          ),
        ),
      ),
    );
  }
}
