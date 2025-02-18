import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SettingDrop extends StatefulWidget {
  const SettingDrop({
    super.key,
    required this.initialValue,
    required this.items,
    required this.onChanged,
  });
  final String initialValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  State<SettingDrop> createState() => _SettingDropState();
}

class _SettingDropState extends State<SettingDrop> {
  late String selectedGender;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorApp.backgroundColor_dark,
        border: Border.all(
          color: ColorApp.borderColor, // Border color,
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        value: selectedGender,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorApp.textColor,
        ),
        isExpanded: true,
        underline: Container(),
        dropdownColor: ColorApp.borderColor,
        style: const TextStyle(color: ColorApp.textColor),
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue!;
          });
          widget.onChanged(newValue);
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: ColorApp.textColor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
