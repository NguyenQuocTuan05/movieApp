import 'package:flutter/material.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/details/details_pages.dart';
import 'package:movie_app/pages/home/home_pages.dart';
import 'package:movie_app/pages/login/login_pages.dart';
import 'package:movie_app/pages/mylist/mylist_pages.dart';
import 'package:movie_app/pages/play/play_pages.dart';
import 'package:movie_app/pages/profile/profile_pages.dart';
import 'package:movie_app/pages/register/register_pages.dart';
import 'package:movie_app/pages/roots/roots_pages.dart';
import 'package:movie_app/pages/setting/setting_pages.dart';
import 'package:movie_app/pages/splash/splash_pages.dart';
import 'package:movie_app/pages/top/top_pages.dart';
import 'package:movie_app/pages/welcome/welcom_pages.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePages(),
      routes: {
        RoutersName.splashPages: (_) => const SplashPages(),
        RoutersName.welcomePages: (_) => const WelcomPages(),
        RoutersName.loginPages: (_) => const LoginPages(),
        RoutersName.registerPages: (_) => const RegisterPages(),
        RoutersName.homePages: (_) => const HomePages(),
        RoutersName.topPages: (_) => const TopPages(),
        RoutersName.detailsPages: (_) => const DetailsPages(),
        RoutersName.playPages: (_) => const PlayPages(),
        RoutersName.mylistPages: (_) => const MylistPages(),
        RoutersName.profilePages: (_) => const ProfilePages(),
        RoutersName.settingPages: (_) => const SettingPages(),
        RoutersName.rootsPages: (_) => const RootsPages(),
      },
    );
  }
}
