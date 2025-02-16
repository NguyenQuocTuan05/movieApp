import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/signin_provider.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      this.onTap});
  final String labelText;
  final IconData prefixIcon;
  final VoidCallback? onTap;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninProvider>(
      builder: (context, provider, child) {
        TextEditingController controller = widget.labelText == 'Email'
            ? provider.emailController
            : provider.passwordController;

        String? errorText = widget.labelText == 'Email'
            ? provider.emailError
            : provider.passwordError;

        return TextField(
          onTap: widget.onTap,
          controller: controller,
          style: const TextStyle(color: ColorApp.textColor, fontSize: 14),
          obscureText:
              widget.labelText == 'Password' ? provider.obscureText : false,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
            errorText: errorText,
            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.labelText == 'Password'
                ? Consumer<SigninProvider>(
                    builder: (context, provider, child) {
                      return IconButton(
                        icon: Icon(
                          provider.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: provider.togglePasswordVisibility,
                      );
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
