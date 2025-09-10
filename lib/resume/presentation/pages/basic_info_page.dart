import 'package:birth_picker/birth_picker.dart';
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
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppPallete.backgroundColor.withOpacity(
                    0.9,
                  ), // light card
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppPallete.greyColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: Apptheme.mediumTextStyle),
                    const SizedBox(height: 10),
                    TitleSelector(
                      titles: ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.'],
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),

                    Text('First Name', style: Apptheme.mediumTextStyle),
                    const SizedBox(height: 10),
                    CustomTextField(controller: controller, label: ''),

                    const SizedBox(height: 20),
                    Text('Last Name', style: Apptheme.mediumTextStyle),
                    const SizedBox(height: 10),
                    CustomTextField(controller: controller, label: ''),

                    const SizedBox(height: 20),
                    Text('Date of Birth', style: Apptheme.mediumTextStyle),
                    const SizedBox(height: 10),
                    BirthPicker(
                      decorationBuilder: (bool isFocused) {
                        return BoxDecoration(
                          border: Border.all(
                            color: isFocused
                                ? AppPallete.backgroundColor
                                : AppPallete.borderColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        );
                      },
                      onChanged: (dateTime) {
                        if (dateTime != null) {
                          print(dateTime.toIso8601String());
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Icon(
                          Icons.arrow_circle_right,
                          color: AppPallete.whiteColor,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Title selector
            ],
          ),
        ),
      ),
    );
  }
}
