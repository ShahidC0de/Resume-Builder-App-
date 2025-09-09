import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';
import 'package:resume_builder/core/theme/theme.dart';

class TitleSelector extends StatefulWidget {
  final List<String> titles;
  final Function(String) onChanged;
  final String? initialValue;

  const TitleSelector({
    super.key,
    required this.titles,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<TitleSelector> createState() => _TitleSelectorState();
}

class _TitleSelectorState extends State<TitleSelector> {
  String? selectedTitle;

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.titles.map((title) {
        final isSelected = title == selectedTitle;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTitle = title;
              widget.onChanged(title);
            });
          },
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
