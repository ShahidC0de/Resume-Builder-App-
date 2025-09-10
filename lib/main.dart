import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/core/theme/theme.dart';
import 'package:resume_builder/resume/presentation/pages/build_resume_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Apptheme.darkThemeMode,
      home: const BuildResume(),
    );
  }
}
