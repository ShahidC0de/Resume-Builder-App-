import 'package:flutter/material.dart';
import 'package:resume_builder/authentication/presentation/pages/login.dart';
import 'package:resume_builder/authentication/presentation/widgets/auth_button.dart';
import 'package:resume_builder/authentication/presentation/widgets/auth_field.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
        child: Form(
          // making all the textformfield a unit.
          // by making unit it can see all the widgets and validate its state.
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(hintext: 'Name', controller: nameController),
              const SizedBox(height: 15),
              AuthField(hintext: 'Email', controller: emailController),
              const SizedBox(height: 15),
              AuthField(
                hintext: 'Password',
                controller: passwordController,
                obsecureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                onpressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: 'Sign Up',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
