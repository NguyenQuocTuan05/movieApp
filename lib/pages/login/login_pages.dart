import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/login/widgets/login_socail.dart';
import 'package:movie_app/widgets/button_widgets.dart';
import 'package:movie_app/widgets/choose_widgets.dart';
import 'package:movie_app/widgets/line_widgets.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 37,
              ),
              Image.asset(
                'assets/images/login.png',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Let’s you in',
                style: TextStyle(
                  fontSize: 48,
                  color: ColorApp.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const LoginSocail(
                  buttonText: 'Continue with Facebook',
                  imagePath: 'assets/images/facebook.png'),
              const SizedBox(
                height: 16,
              ),
              const LoginSocail(
                buttonText: 'Continue with Google',
                imagePath: 'assets/images/google.png',
              ),
              const SizedBox(
                height: 16,
              ),
              const LoginSocail(
                  buttonText: 'Continue with Apple',
                  imagePath: 'assets/images/apple.png'),
              const SizedBox(
                height: 46,
              ),
              const LineWidgets(text: 'or'),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.registerPages);
                },
                child: const ButtonWidgets(buttonText: 'Sign in with password'),
              ),
              const SizedBox(
                height: 30,
              ),
              const ChooseWidgets(
                  choose: 'Sign up', question: 'Don’t have an account?'),
            ],
          ),
        ),
      ),
    );
  }
}
