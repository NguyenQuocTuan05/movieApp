import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/bell/bell_pages.dart';
import 'package:movie_app/pages/card/card_pages.dart';
import 'package:movie_app/pages/details/details_pages.dart';
import 'package:movie_app/pages/download/download_pages.dart';
import 'package:movie_app/pages/download_option/downloadoption_pages.dart';
import 'package:movie_app/pages/explore/explore_pages.dart';
import 'package:movie_app/pages/home/home_pages.dart';
import 'package:movie_app/pages/login/login_pages.dart';
import 'package:movie_app/pages/mylist/mylist_pages.dart';
import 'package:movie_app/pages/notification/notification_pages.dart';
import 'package:movie_app/pages/payment/payment_pages.dart';
import 'package:movie_app/pages/play/play_pages.dart';
import 'package:movie_app/pages/premium/premium_pages.dart';
import 'package:movie_app/pages/profile/profile_pages.dart';
import 'package:movie_app/pages/register/register_pages.dart';
import 'package:movie_app/pages/releases/releases_pages.dart';
import 'package:movie_app/pages/roots/roots_pages.dart';
import 'package:movie_app/pages/setting/setting_pages.dart';
import 'package:movie_app/pages/sign_in/sign_in_pages.dart';
import 'package:movie_app/pages/splash/splash_pages.dart';
import 'package:movie_app/pages/summary/summary_pages.dart';
import 'package:movie_app/pages/top/top_pages.dart';
import 'package:movie_app/pages/welcome/welcom_pages.dart';
import 'package:movie_app/provider/details_provider.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:movie_app/provider/setting_provider.dart';
import 'package:movie_app/provider/social_provider.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/mylist_provider.dart';
import 'package:movie_app/provider/notification_provider.dart';
import 'package:movie_app/provider/play_provider.dart';
import 'package:movie_app/provider/register_provider.dart';
import 'package:movie_app/provider/explore_provider.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:movie_app/provider/signin_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => DetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExploreProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MylistProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DownloadProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (_) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlayProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SocialProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingProvider(),
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
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorApp.backgroundColor_light,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: ColorApp.backgroundColor_dark),
          bodyMedium: TextStyle(color: ColorApp.backgroundColor_dark),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorApp.backgroundColor_light,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: ColorApp.backgroundColor_dark,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: ColorApp.textColor),
          bodyMedium: TextStyle(color: ColorApp.textColor),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorApp.backgroundColor_dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const RootsPages(),
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
        RoutersName.releasesPages: (_) => const ReleasesPages(),
        RoutersName.explorePages: (_) => const ExplorePages(),
        RoutersName.premiumPages: (_) => const PremiumPages(),
        RoutersName.paymentPages: (_) => const PaymentPages(),
        RoutersName.cardPages: (_) => const CardPages(),
        RoutersName.summaryPages: (_) => const SummaryPages(),
        RoutersName.notificationPages: (_) => const NotificationPages(),
        RoutersName.downloadOptionPages: (_) => const DownloadoptionPages(),
        RoutersName.signinPages: (_) => const SignInPages(),
        RoutersName.downloadPages: (_) => const DownloadPages(),
        RoutersName.bellPages: (_) => const BellPages(),
      },
    );
  }
}
