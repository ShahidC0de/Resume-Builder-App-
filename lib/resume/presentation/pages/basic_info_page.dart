import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';

import 'package:resume_builder/core/theme/theme.dart';
import 'package:resume_builder/resume/presentation/widgets/custom_field.dart';
import 'package:resume_builder/resume/presentation/widgets/title_selector.dart';

class BasicInfoPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const BasicInfoPage());
  const BasicInfoPage({super.key});

  @override
  State<BasicInfoPage> createState() => _BasicInfoPageState();
}

class _BasicInfoPageState extends State<BasicInfoPage> {
  final TextEditingController controller = TextEditingController();
  final String hintext = "Name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Details',
          style: Apptheme.mediumTextStyle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppPallete.whiteColor,
                  child: Text(
                    'Photo',
                    style: Apptheme.mediumTextStyle.copyWith(
                      fontSize: 20,
                      color: AppPallete.backgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Title selector
              Text('Title', style: Apptheme.mediumTextStyle),
              const SizedBox(height: 10),
              TitleSelector(
                titles: ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.'],
                onChanged: (value) {},
              ),
              const SizedBox(height: 30),

              // Name Fields
              CustomTextField(controller: controller, label: 'First Name'),
              const SizedBox(height: 16),
              CustomTextField(controller: controller, label: 'Last Name'),
              const SizedBox(height: 16),
              CustomTextField(controller: controller, label: 'Preferred Name'),
            ],
          ),
        ),
      ),
    );
  }
}
