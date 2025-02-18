import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SettingNation extends StatefulWidget {
  const SettingNation({super.key});

  @override
  _SettingNationState createState() => _SettingNationState();
}

class _SettingNationState extends State<SettingNation> {
  String? selectedCountryCode = '+84';
  String? selectedCountryFlag = 'assets/images/vietnam.png';
  TextEditingController phoneController = TextEditingController();

  final List<Map<String, String>> countries = [
    {'code': '+1', 'flag': 'assets/images/united-states.png', 'country': 'USA'},
    {
      'code': '+44',
      'flag': 'assets/images/united-kingdom.png',
      'country': 'UK'
    },
    {'code': '+84', 'flag': 'assets/images/vietnam.png', 'country': 'Vietnam'},
    {'code': '+82', 'flag': 'assets/images/china.png', 'country': 'China'},
    {'code': '+81', 'flag': 'assets/images/france.png', 'country': 'France'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorApp.backgroundColor_dark,
        border: Border.all(
          width: 1,
          color: ColorApp.borderColor,
        ),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: selectedCountryCode,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: ColorApp.textColor,
            ),
            underline: Container(),
            dropdownColor: ColorApp.borderColor,
            onChanged: (String? newValue) {
              setState(() {
                selectedCountryCode = newValue;
                selectedCountryFlag = countries.firstWhere(
                    (country) => country['code'] == newValue)['flag'];
              });
            },
            items: countries
                .map<DropdownMenuItem<String>>((Map<String, String> country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Row(
                  children: [
                    Image.asset(
                      country['flag']!,
                      width: 30,
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      country['code']!,
                      style: const TextStyle(
                        color: ColorApp.platformColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: const TextStyle(color: ColorApp.borderColor),
                labelStyle:
                    const TextStyle(color: ColorApp.textColor, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorApp.backgroundColor_dark),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: ColorApp.backgroundColor_dark,
              ),
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: ColorApp.textColor),
              cursorColor: ColorApp.platformColor,
            ),
          ),
        ],
      ),
    );
  }
}
