import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/login/widgets/login_socail.dart';
import 'package:movie_app/provider/social_provider.dart';
import 'package:movie_app/widgets/button_widgets.dart';
import 'package:movie_app/widgets/choose_widgets.dart';
import 'package:movie_app/widgets/line_widgets.dart';
import 'package:provider/provider.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              Text(
                'Let’s you in',
                style: TextStyle(
                  fontSize: 48,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<SocialProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () async {
                      await provider.signInWithFacebook(context);
                    },
                    child: const LoginSocail(
                        buttonText: 'Continue with Facebook',
                        imagePath: 'assets/images/facebook.png'),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<SocialProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () async {
                      await provider.signInWithGoogle(context);
                    },
                    child: const LoginSocail(
                      buttonText: 'Continue with Google',
                      imagePath: 'assets/images/google.png',
                    ),
                  );
                },
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
                  Navigator.pushNamed(context, RoutersName.signinPages);
                },
                child: const ButtonWidgets(
                  buttonText: 'Sign in with password',
                  color: ColorApp.platformColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ChooseWidgets(
                choose: 'Sign up',
                question: 'Don’t have an account?',
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.registerPages);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
