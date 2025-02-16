import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/register/widgets/register_form.dart';
import 'package:movie_app/pages/register/widgets/register_social.dart';
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
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RegisterProvider>().resetForm();
    });
  }

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
                'Create Your Account',
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
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
                height: 50,
              ),
              Consumer<RegisterProvider>(builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    provider.register(context);
                    if (provider.emailError == null &&
                        provider.passwordError == null) {
                      Navigator.pushNamed(context, RoutersName.signinPages);
                    }
                  },
                  child: const ButtonWidgets(
                    color: ColorApp.platformColor,
                    buttonText: 'Sign up',
                  ),
                );
              }),
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
                choose: 'Sign in',
                question: 'Already have an account?',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RoutersName.signinPages);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
