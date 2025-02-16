import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/register/widgets/register_remember.dart';
import 'package:movie_app/pages/register/widgets/register_social.dart';
import 'package:movie_app/pages/sign_in/widgets/sign_in_form.dart';
import 'package:movie_app/provider/signin_provider.dart';
import 'package:movie_app/widgets/button_widgets.dart';
import 'package:movie_app/widgets/choose_widgets.dart';
import 'package:movie_app/widgets/line_widgets.dart';
import 'package:provider/provider.dart';

class SignInPages extends StatefulWidget {
  const SignInPages({super.key});

  @override
  State<SignInPages> createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Login to Your Account',
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SignInForm(labelText: 'Email', prefixIcon: Icons.email),
              const SizedBox(
                height: 20,
              ),
              const SignInForm(labelText: 'Password', prefixIcon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              RegisterRemember(
                value: context.watch<SigninProvider>().rememberMe,
                onChanged: (value) {
                  context.read<SigninProvider>().toggleRememberMe(true);
                },
                isSignIn: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<SigninProvider>(
                builder: (builder, provider, child) {
                  return GestureDetector(
                    onTap: () async {
                      await provider.login(context);
                    },
                    child: const ButtonWidgets(
                      buttonText: 'Sign in',
                      color: ColorApp.platformColor,
                    ),
                  );
                },
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
              ChooseWidgets(
                choose: 'Sign up',
                question: 'Don’t have an account?',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutersName.registerPages);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
