import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/profile/widgets/profile_avt.dart';
import 'package:movie_app/pages/profile/widgets/profile_logout.dart';
import 'package:movie_app/pages/profile/widgets/profile_option.dart';
import 'package:movie_app/pages/profile/widgets/profile_optionwithswitch.dart';
import 'package:movie_app/pages/profile/widgets/profile_premium.dart';
import 'package:movie_app/widgets/appbar_widgets.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppbarWidgets(
        title: 'Profile',
        showSearchIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const ProfileAvt(),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.premiumPages);
                },
                child: const ProfilePremium(),
              ),
              const SizedBox(
                height: 24,
              ),
              ProfileOption(
                icon: IconlyBold.profile,
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.settingPages);
                },
              ),
              ProfileOption(
                icon: IconlyBold.notification,
                title: 'Notification',
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.notificationPages);
                },
              ),
              ProfileOption(
                icon: IconlyBold.download,
                title: 'Download',
                onTap: () {
                  Navigator.pushNamed(context, RoutersName.downloadOptionPages);
                },
              ),
              ProfileOption(
                icon: Icons.language,
                title: 'Language',
                trailing: Text(
                  'English (US)',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                onTap: () {},
              ),
              const ProfileOptionWithSwitch(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
              ),
              ProfileOption(
                icon: IconlyBold.logout,
                title: 'Log Out',
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      context: context,
                      builder: (context) {
                        return const ProfileLogout();
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
