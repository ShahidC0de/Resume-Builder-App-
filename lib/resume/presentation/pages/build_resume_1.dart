import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/theme.dart';
import 'package:resume_builder/resume/presentation/pages/basic_info_page.dart';
import 'package:resume_builder/resume/presentation/widgets/custom_grid.dart';

class BuildResume extends StatefulWidget {
  const BuildResume({super.key});

  @override
  State<BuildResume> createState() => _BuildResumeState();
}

class _BuildResumeState extends State<BuildResume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Build a Job-Winning ATS Resume',
              style: Apptheme.mediumTextStyle.copyWith(fontSize: 30),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, BasicInfoPage.route());
                    },
                    child: CustomGrid(
                      iconPath: 'assets/icons/create_resumee.png',
                      title: 'Create Resume',
                    ),
                  ),
                  CustomGrid(
                    iconPath: 'assets/icons/download_icon.png',
                    title: 'Downloads',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // ..................... MY INFORMATION ....................
    // Legal Name
    // First Name
    // Last Name
    // Address
    // City
    // State
    // Email Address
    // Phone Number
    // Country code
    // ...................... MY EXPERIENCE ....................
  }
}
