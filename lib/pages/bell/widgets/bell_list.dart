import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class BellList extends StatelessWidget {
  const BellList({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
      return ListView.separated(
        itemCount: provider.notifications.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: Text(provider.notifications[index]),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  provider.removeNotification(index);
                },
                child: Image.asset(
                  'assets/images/delete.png',
                  color: ColorApp.platformColor,
                ),
              ),
            ],
          );
        },
      );
    }));
  }
}
