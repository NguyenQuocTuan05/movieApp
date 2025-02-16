import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/pages/download_option/widgets/wifi_download.dart';
import 'package:movie_app/pages/profile/widgets/profile_option.dart';
import 'package:movie_app/widgets/appbar_pay.dart';

class DownloadoptionPages extends StatefulWidget {
  const DownloadoptionPages({super.key});

  @override
  State<DownloadoptionPages> createState() => _DownloadPagesState();
}

class _DownloadPagesState extends State<DownloadoptionPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppbarPay(title: 'Download'),
              const SizedBox(height: 24),
              const WifiDownload(),
              const SizedBox(height: 24),
              ProfileOption(
                icon: IconlyBold.download,
                title: 'Smart Downloads',
                onTap: () {},
              ),
              const SizedBox(height: 24),
              ProfileOption(
                  icon: IconlyBold.video, title: 'Video Quality', onTap: () {}),
              const SizedBox(height: 24),
              ProfileOption(
                  icon: IconlyBold.voice, title: 'Audio Quality', onTap: () {}),
              const SizedBox(height: 24),
              ProfileOption(
                  icon: IconlyBold.delete,
                  title: 'Delete All Downloads',
                  onTap: () {}),
              const SizedBox(height: 24),
              ProfileOption(
                  icon: IconlyBold.delete, title: 'Delete Cache', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
