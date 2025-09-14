import 'dart:io';

import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';

import 'package:resume_builder/core/theme/theme.dart';
import 'package:resume_builder/resume/presentation/pages/education_page.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DateTime? _selectedDate;
  XFile? _image;
  String? _title;
  String? completePhoneNumber;
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  final TextEditingController controller = TextEditingController();
  final String hintext = "Name";
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppPallete.whiteColor,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path))
                        : null,
                    child: _image == null
                        ? Text(
                            'Photo',
                            style: Apptheme.mediumTextStyle.copyWith(
                              fontSize: 20,
                              color: AppPallete.backgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: AppPallete.backgroundColor.withOpacity(
                    0.9,
                  ), // light card
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
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
                      selectedTitle: _title,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _title = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name', style: Apptheme.mediumTextStyle),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: nameController,
                              label: '',
                            ),

                            const SizedBox(height: 20),
                            Text('Address', style: Apptheme.mediumTextStyle),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: addressController,
                              label: '',
                            ),
                            const SizedBox(height: 10),
                            Text('Email', style: Apptheme.mediumTextStyle),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: emailController,
                              label: '',
                            ),

                            const SizedBox(height: 20),
                            Text('Phone', style: Apptheme.mediumTextStyle),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    IntlPhoneField(
                      onChanged: (PhoneNumber? value) {
                        if (value != null) {
                          setState(() {
                            completePhoneNumber = value.completeNumber;
                          });
                        } else {
                          completePhoneNumber = null;
                        }
                      },
                      initialCountryCode: 'PK',
                      controller: phoneController,
                      decoration: InputDecoration(),
                    ),
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
                          _selectedDate = dateTime;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              _selectedDate != null &&
                              _title != null) {
                            print(nameController.text);
                            print(addressController.text);
                            print(emailController.text);
                            print(phoneController.text);
                            print(_selectedDate);
                            print(_title);
                            print(completePhoneNumber);
                            // Process data.
                            Navigator.of(context).push(EducationPage.route());
                          }
                        },
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
