import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';
import 'package:resume_builder/core/theme/theme.dart';

class TitleSelector extends StatelessWidget {
  final List<String> titles;
  final Function(String) onChanged;
  final String? selectedTitle; // <-- receive from parent

  const TitleSelector({
    super.key,
    required this.titles,
    required this.onChanged,
    this.selectedTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: titles.map((title) {
        final isSelected = title == selectedTitle;
        return GestureDetector(
          onTap: () => onChanged(title),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppPallete.backgroundColor
                  : AppPallete.greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: Apptheme.mediumTextStyle.copyWith(
                color: isSelected
                    ? AppPallete.whiteColor
                    : AppPallete.backgroundColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
