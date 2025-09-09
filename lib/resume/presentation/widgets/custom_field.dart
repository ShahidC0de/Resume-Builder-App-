import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';
import 'package:resume_builder/core/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isOptional;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isOptional = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: Apptheme.mediumTextStyle.copyWith(color: AppPallete.whiteColor),
      decoration: InputDecoration(
        labelText: label + (isOptional ? ' (Optional)' : ''),
        labelStyle: Apptheme.mediumTextStyle.copyWith(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppPallete.whiteColor, width: 2),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      validator:
          validator ??
          (value) {
            if (!isOptional && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
    );
  }
}
