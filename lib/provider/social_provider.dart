import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/apps/helper/flushbar_message.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SocialProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FlushbarMessage _flushbar = FlushbarMessage();
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        _flushbar.show(context, 'Login successful! Welcome to Movie App.');
        context.read<HomeProvider>().addNotification(
            'Login successful by Facebook! Welcome to Movie App.');
        Navigator.pushReplacementNamed(context, RoutersName.rootsPages);
      } else {
        _flushbar.show(context, result.message);
      }
    } catch (e) {
      _flushbar.show(context, e.toString());
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        _flushbar.show(context, 'Login with Google successful!');
        context
            .read<HomeProvider>()
            .addNotification('Login with Google successful!');
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushReplacementNamed(context, RoutersName.rootsPages);
          },
        );
      }
    } catch (e) {
      _flushbar.show(context, 'Google Sign-In failed!');
    }
  }
}
