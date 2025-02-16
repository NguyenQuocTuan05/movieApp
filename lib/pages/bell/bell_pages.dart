import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/bell/widgets/bell_list.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/appbar_pay.dart';
import 'package:provider/provider.dart';

class BellPages extends StatelessWidget {
  const BellPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  const AppbarPay(title: 'Notification'),
                  const Spacer(),
                  Consumer<HomeProvider>(builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        provider.clearNotifications();
                      },
                      child: const Icon(
                        Icons.close,
                        color: ColorApp.platformColor,
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const BellList(),
            ],
          ),
        ),
      ),
    );
  }
}
