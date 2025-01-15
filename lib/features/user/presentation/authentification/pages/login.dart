import 'package:buniashop/features/user/presentation/authentification/logic/cubit/showpassword_cubit.dart';
import 'package:buniashop/features/user/presentation/authentification/widgets/custom_text_field.dart';
import 'package:buniashop/features/user/presentation/authentification/widgets/rounded_elevated_button.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:buniashop/utils/validation_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                  key: _loginFormKey,
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
                      const SizedBox(
                        height: 5,
                      ),
                      RoundedElevatedButton(
                        buttonText: loginText,
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(newUser),
                      RoundedElevatedButton(
                        buttonText: registerText,
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
