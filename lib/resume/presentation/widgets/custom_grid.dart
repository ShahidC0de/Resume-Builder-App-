import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';
import 'package:resume_builder/core/theme/theme.dart';

class CustomGrid extends StatelessWidget {
  final String iconPath;
  final String title;
  const CustomGrid({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 100, width: 100),
          Text(
            title,
            style: Apptheme.mediumTextStyle.copyWith(
              color: AppPallete.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
