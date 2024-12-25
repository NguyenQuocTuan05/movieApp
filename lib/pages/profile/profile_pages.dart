import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
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
      backgroundColor: ColorApp.backgroundColor,
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
              const ProfilePremium(),
              const SizedBox(
                height: 24,
              ),
              ProfileOption(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.notifications,
                title: 'Notification',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.download,
                title: 'Download',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.security,
                title: 'Security',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.language,
                title: 'Language',
                trailing: const Text('English (US)',
                    style: TextStyle(color: ColorApp.textColor)),
                onTap: () {},
              ),
              ProfileOptionWithSwitch(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                value: true,
                onChanged: (value) {},
              ),
              ProfileOption(
                icon: Icons.help,
                title: 'Help Center',
                onTap: () {},
              ),
              ProfileOption(
                icon: Icons.logout,
                title: 'Log Out',
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: ColorApp.borderColor,
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
