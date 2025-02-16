import 'package:flutter/material.dart';
import 'package:movie_app/provider/notification_provider.dart';
import 'package:movie_app/widgets/appbar_pay.dart';
import 'package:movie_app/widgets/switchs_widgets.dart';
import 'package:provider/provider.dart';

class NotificationPages extends StatefulWidget {
  const NotificationPages({super.key});

  @override
  State<NotificationPages> createState() => _NotificationPagesState();
}

class _NotificationPagesState extends State<NotificationPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const AppbarPay(title: 'Notification'),
                const SizedBox(height: 24),
                Consumer<NotificationProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: List.generate(
                        provider.notificationOptions.length,
                        (index) {
                          final option = provider.notificationOptions[index];
                          return Column(
                            children: [
                              SwitchsWidgets(
                                title: option['title'],
                                value: option['value'],
                                onChanged: (newValue) =>
                                    provider.toggleNotification(index),
                              ),
                              const SizedBox(height: 24),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
