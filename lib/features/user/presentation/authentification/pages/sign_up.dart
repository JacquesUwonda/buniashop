import 'package:buniashop/features/user/presentation/authentification/widgets/custom_text_field.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:buniashop/utils/validation_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/cubit/showpassword_cubit.dart';
import '../widgets/rounded_elevated_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  /////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Text(
                  appName,
                  style: GoogleFonts.italianno(
                    color: productNameColor,
                    fontSize: 70,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    spacing: 15,
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
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        prefix: const Icon(
                          Icons.email,
                          color: bottonColor,
                        ),
                        suffix: null,
                        hintText: emailText,
                      ),
                      BlocBuilder<ShowpasswordCubit, ShowpasswordState>(
                        builder: (context, state) {
                          return CustomTextFormField(
                            controller: _passwordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return requiredText;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: state.isPasswordVisible,
                            prefix: const Icon(
                              Icons.lock,
                              color: bottonColor,
                            ),
                            suffix: InkWell(
                              onTap: () {
                                context.read<ShowpasswordCubit>().showPassword(
                                    showPassword: !state.isPasswordVisible);
                              },
                              child: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: bottonColor,
                              ),
                            ),
                            hintText: passwordText,
                          );
                        },
                      ),
                      BlocBuilder<ShowpasswordCubit, ShowpasswordState>(
                        builder: (context, state) {
                          return CustomTextFormField(
                            controller: _confirmPasswordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return requiredText;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: state.isPasswordVisible,
                            prefix: const Icon(
                              Icons.lock,
                              color: bottonColor,
                            ),
                            suffix: InkWell(
                              onTap: () {
                                context.read<ShowpasswordCubit>().showPassword(
                                    showPassword: !state.isPasswordVisible);
                              },
                              child: Icon(
                                state.isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: bottonColor,
                              ),
                            ),
                            hintText: confirmPasswordText,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RoundedElevatedButton(
                        buttonText: registerText,
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(oldUser),
                      RoundedElevatedButton(
                        buttonText: loginText,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
