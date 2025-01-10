import 'package:buniashop/features/user/presentation/authentification/widgets/custom_text_field.dart';
import 'package:buniashop/features/user/presentation/authentification/widgets/rounded_elevated_button.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:buniashop/utils/validation_rules.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _LoginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Form(
              key: _LoginFormKey,
              child: Column(
                spacing: 10,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return requiredText;
                      } else if (!ValidationRules.emailValidation
                          .hasMatch(val)) {
                        return provideValidEmail;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    suffix: null,
                    hintText: emailText,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return requiredText;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordVisible,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: bottonColor,
                      ),
                    ),
                    hintText: passwordText,
                  ),
                  RoundedElevatedButton(
                    buttonText: loginText,
                    onPressed: () {
                      if (_LoginFormKey.currentState!.validate()) {}
                    },
                  ),
                  const Text(
                    newUser,
                    style: TextStyle(color: bottonColor, fontSize: 12),
                  ),
                  RoundedElevatedButton(
                      buttonText: signUpText,
                      onPressed: () {
                        // Navigate to Sign Up screen
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
