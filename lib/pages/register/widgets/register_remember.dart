import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class RegisterRemember extends StatefulWidget {
  const RegisterRemember({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<RegisterRemember> createState() => _RegisterRememberState();
}

class _RegisterRememberState extends State<RegisterRemember> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              widget.onChanged(isChecked);
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorApp.platformColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
              color: isChecked ? ColorApp.platformColor : Colors.transparent,
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Remember me',
          style: TextStyle(
            fontSize: 14,
            color: ColorApp.textColor,
          ),
        ),
      ],
    );
  }
}
