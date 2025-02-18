import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/setting/widgets/setting_drop.dart';
import 'package:movie_app/pages/setting/widgets/setting_info.dart';
import 'package:movie_app/pages/setting/widgets/setting_nation.dart';
import 'package:movie_app/widgets/avt_widgets.dart';
import 'package:movie_app/widgets/button_widgets.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({super.key});

  @override
  State<SettingPages> createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  String gender = 'Male';
  String country = 'Vietnam';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              const AvtWidgets(),
              const SizedBox(height: 24),
              const SettingInfo(
                text: 'First Name',
                fieldType: 'firstName',
              ),
              const SizedBox(height: 24),
              const SettingInfo(
                text: 'Last Name',
                fieldType: 'lastName',
              ),
              const SizedBox(
                height: 24,
              ),
              const SettingInfo(
                text: 'Email',
                fieldType: 'email',
              ),
              const SizedBox(
                height: 24,
              ),
              const SettingNation(),
              const SizedBox(
                height: 24,
              ),
              SettingDrop(
                initialValue: gender,
                items: const ['Male', 'Female'],
                onChanged: (String? newGender) {
                  setState(() {
                    gender = newGender!;
                  });
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SettingDrop(
                initialValue: country,
                items: const ['USA', 'Canada', 'Germany', 'Vietnam'],
                onChanged: (String? newCountry) {
                  setState(() {
                    country = newCountry!;
                  });
                },
              ),
              const SizedBox(
                height: 60,
              ),
              const ButtonWidgets(
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
