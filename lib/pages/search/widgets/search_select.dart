import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchSelect extends StatefulWidget {
  const SearchSelect({
    super.key,
    required this.text,
    required this.textApi,
  });
  final String text;
  final Map<dynamic, String> textApi;

  @override
  State<SearchSelect> createState() => _SearchSelectState();
}

class _SearchSelectState extends State<SearchSelect> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    final List<dynamic> keys = widget.textApi.keys.toList();
    final List<String> values = widget.textApi.values.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20,
            color: ColorApp.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) {
              final itemKey = keys[index];
              final apiText = values[index];
              final isSelected = provider.isSelected(widget.text, itemKey);
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.toggleSelection(widget.text, itemKey);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: isSelected
                              ? ColorApp.backgroundColor_dark
                              : ColorApp.platformColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        color: isSelected
                            ? ColorApp.platformColor
                            : ColorApp.backgroundColor_dark,
                      ),
                      child: Text(
                        apiText,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected
                              ? ColorApp.textColor
                              : ColorApp.platformColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
