import 'package:flutter/material.dart';
import 'package:resume_builder/authentication/presentation/pages/sign_up.dart';
import 'package:resume_builder/authentication/presentation/widgets/auth_button.dart';
import 'package:resume_builder/authentication/presentation/widgets/auth_field.dart';
import 'package:resume_builder/core/theme/app_pallete.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(controller: emailController, hintext: 'Email'),
              const SizedBox(height: 15),
              AuthField(
                controller: passwordController,
                hintext: 'Password',
                obsecureText: true,
              ),
              const SizedBox(height: 15),
              AuthGradientButton(
                onpressed: () {
                  if (formkey.currentState!.validate()) {}
                },
                title: 'Sign In',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.w600,
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
