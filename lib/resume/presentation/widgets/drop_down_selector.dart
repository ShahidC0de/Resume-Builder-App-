import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';

// ignore: must_be_immutable
class DropDownSelector extends StatelessWidget {
  final List<String> educationLevels;
  final Function(String) onChanged;
  String dropdownSelectorTitle = "Select Education Level";
  DropDownSelector({
    super.key,
    required this.educationLevels,
    required this.onChanged,
    this.dropdownSelectorTitle = "Select Education Level",
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppPallete.backgroundColor,
      ),
      items: educationLevels
          .map(
            (level) => DropdownMenuItem(
              value: level,
              child: Text(level, overflow: TextOverflow.ellipsis, maxLines: 1),
            ),
          )
          .toList(),
      onChanged: (value) {
        onChanged(value!);
      },
      hint: Text(dropdownSelectorTitle),
    );
  }
}
