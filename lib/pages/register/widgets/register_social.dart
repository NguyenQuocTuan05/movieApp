import 'package:flutter/material.dart';
import 'package:movie_app/pages/register/widgets/register_details.dart';
import 'package:movie_app/provider/social_provider.dart';
import 'package:provider/provider.dart';

class RegisterSocial extends StatelessWidget {
  const RegisterSocial({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<SocialProvider>(
            builder: (context, provider, child) {
              return GestureDetector(
                onTap: () async {
                  await provider.signInWithFacebook(context);
                },
                child: const RegisterDetails(
                  image: 'assets/images/facebook.png',
                ),
              );
            },
          ),
          Consumer<SocialProvider>(
            builder: (context, provider, child) {
              return GestureDetector(
                onTap: () async {
                  await provider.signInWithGoogle(context);
                },
                child: const RegisterDetails(
                  image: 'assets/images/google.png',
                ),
              );
            },
          ),
          const RegisterDetails(image: 'assets/images/apple.png'),
        ],
      ),
    );
  }
}
