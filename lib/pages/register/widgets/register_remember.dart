import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/signin_provider.dart';
import 'package:provider/provider.dart';

class RegisterRemember extends StatefulWidget {
  const RegisterRemember({
    super.key,
    required this.onChanged,
    required this.value,
    required this.isSignIn,
  });
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isSignIn;

  @override
  State<RegisterRemember> createState() => _RegisterRememberState();
}

class _RegisterRememberState extends State<RegisterRemember> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<SigninProvider>(
          builder: (builder, provider, child) {
            return GestureDetector(
              onTap: () => provider.toggleRememberMe(widget.isSignIn),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorApp.platformColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: provider.rememberMe
                      ? ColorApp.platformColor
                      : Colors.transparent,
                ),
                child: provider.rememberMe
                    ? const Icon(
                        Icons.check,
                        size: 18,
                        color: ColorApp.textColor,
                      )
                    : null,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        Text(
          'Remember me',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
