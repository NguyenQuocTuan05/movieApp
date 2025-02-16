import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DateCard extends StatefulWidget {
  const DateCard(
      {super.key, required this.controller, required this.onDateSelected});
  final TextEditingController controller;
  final Function(DateTime) onDateSelected;

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  final TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = "${picked.day}/${picked.month}/${picked.year}";
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expiry Date',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        TextField(
          controller: widget.controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            suffixIcon: Icon(
              IconlyBold.calendar,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            fillColor: ColorApp.borderColor,
            hintStyle: const TextStyle(
              color: ColorApp.borderColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorApp.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: ColorApp.borderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
