import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/provider/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.labelText,
    required this.prefixIcon,
  });
  final String labelText;
  final IconData prefixIcon;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<RegisterProvider>();
    return TextField(
      controller: widget.labelText == 'Email'
          ? provider.emailController
          : provider.passwordController,
      style: const TextStyle(color: ColorApp.textColor, fontSize: 14),
      obscureText: widget.labelText == 'Password' ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff9E9E9E),
        ),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.labelText == 'Password'
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
