import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/setting/widgets/setting_info.dart';
import 'package:movie_app/pages/setting/widgets/setting_nation.dart';
import 'package:movie_app/widgets/avt_widgets.dart';
import 'package:movie_app/widgets/button_widgets.dart';

class SettingPages extends StatelessWidget {
  const SettingPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).textTheme.bodyLarge!.color,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              AvtWidgets(),
              SizedBox(height: 24),
              SettingInfo(text: 'abc'),
              SizedBox(height: 24),
              SettingInfo(text: 'afc'),
              SizedBox(
                height: 24,
              ),
              SettingInfo(
                text: 'andrew_ainsley@yourdomain.com',
                icon: Icons.mail,
              ),
              SizedBox(
                height: 24,
              ),
              SettingNation(),
              SizedBox(
                height: 24,
              ),
              SettingInfo(
                text: 'Male',
                icon: Icons.arrow_drop_down,
              ),
              SizedBox(
                height: 24,
              ),

              SettingInfo(
                text: 'United States',
                icon: Icons.arrow_drop_down,
              ),
              SizedBox(
                height: 60,
              ),
              // Update Button
              ButtonWidgets(
                buttonText: 'Update',
                color: ColorApp.platformColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
