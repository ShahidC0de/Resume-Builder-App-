import 'package:flutter/material.dart';
import 'package:resume_builder/core/contants/education_title.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';
import 'package:resume_builder/core/theme/theme.dart';
import 'package:resume_builder/resume/presentation/widgets/custom_field.dart';
import 'package:resume_builder/resume/presentation/widgets/drop_down_selector.dart';

class EducationPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EducationPage());
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController gradeOrScoreController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Education')),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppPallete.backgroundColor.withOpacity(0.9), // light card
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Higher Education', style: Apptheme.mediumTextStyle),
              const SizedBox(height: 10),
              DropDownSelector(
                educationLevels: educationLevels,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Text('Course/Degree', style: Apptheme.mediumTextStyle),
              const SizedBox(height: 10),

              DropDownSelector(
                educationLevels: courses,
                onChanged: (value) {},
                dropdownSelectorTitle: 'Select Course/Degree',
              ),
              const SizedBox(height: 20),

              SizedBox(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'School/University',
                        style: Apptheme.mediumTextStyle,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: schoolNameController,
                        label: '',
                      ),

                      const SizedBox(height: 20),
                      Text('Grade/Score', style: Apptheme.mediumTextStyle),
                      const SizedBox(height: 10),

                      CustomTextField(
                        controller: gradeOrScoreController,
                        label: '',
                      ),
                      const SizedBox(height: 10),
                      Text('From', style: Apptheme.mediumTextStyle),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropDownSelector(
                              dropdownSelectorTitle: 'Month',
                              educationLevels: months,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropDownSelector(
                              dropdownSelectorTitle: 'Year',
                              educationLevels: years,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('To', style: Apptheme.mediumTextStyle),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropDownSelector(
                              dropdownSelectorTitle: 'Month',
                              educationLevels: months,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropDownSelector(
                              dropdownSelectorTitle: 'Year',
                              educationLevels: years,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
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
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              // IntlPhoneField(
              //   onChanged: (PhoneNumber? value) {
              //     if (value != null) {
              //       setState(() {
              //         completePhoneNumber = value.completeNumber;
              //       });
              //     } else {
              //       completePhoneNumber = null;
              //     }
              //   },
              //   initialCountryCode: 'PK',
              //   controller: phoneController,
              //   decoration: InputDecoration(),
              // ),
              // Text('Date of Birth', style: Apptheme.mediumTextStyle),
              const SizedBox(height: 10),
              // BirthPicker(
              //   decorationBuilder: (bool isFocused) {
              //     return BoxDecoration(
              //       border: Border.all(
              //         color: isFocused
              //             ? AppPallete.backgroundColor
              //             : AppPallete.borderColor,
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.circular(10),
              //     );
              //   },
              //   onChanged: (dateTime) {
              //     if (dateTime != null) {
              //       _selectedDate = dateTime;
              //     }
              //   },
              // ),
              SizedBox(height: 30),
              // Center(
              //   child: ElevatedButton.icon(
              //     onPressed: () {
              //       if (formKey.currentState!.validate() &&
              //           _selectedDate != null &&
              //           _title != null) {
              //         print(nameController.text);
              //         print(addressController.text);
              //         print(emailController.text);
              //         print(phoneController.text);
              //         print(_selectedDate);
              //         print(_title);
              //         print(completePhoneNumber);
              //         // Process data.
              //       }
              //     },
              //     label: Icon(
              //       Icons.arrow_circle_right,
              //       color: AppPallete.whiteColor,
              //       size: 60,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
