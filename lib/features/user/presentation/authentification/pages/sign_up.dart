import 'package:buniashop/dependency_injection.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';
import 'package:buniashop/features/user/presentation/authentification/widgets/custom_text_field.dart';
import 'package:buniashop/utils/alerts_and_loader.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:buniashop/utils/validation_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
  final sl = GetIt.instance;

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
      body: BlocListener<RegisterUserBloc, UserState>(
        listener: (context, state) {
          if (state is UserEchecState) {
            showSnackBar(context, state.reason, errorColor, dismiss);
          } else if (state is UserSuccess) {
            var store = sl<Store>();
            var user = state.result as User;
            sl<Store>().addUserId(user.userId);
            Navigator.of(context).popAndPushNamed("/profil");
          }
        },
        child: BlocBuilder<RegisterUserBloc, UserState>(
          builder: (context, state) {
            var loading = false;
            if (state is UserInitialState) {
            } else if (state is UserLoadingState) {
              loading = true;
            }
            return buildContext(context, loading);
          },
        ),
      ),
    );
  }

  Center buildContext(BuildContext context, bool loading) {
    if (loading) {
      return Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Loadings.loadingAnimationWidget,
            Text(
              loadingText,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: productBottonColor,
              ),
            )
          ],
        ),
      );
    }
    return Center(
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
                        if (_registerFormKey.currentState!.validate()) {
                          context.read<RegisterUserBloc>().add(
                                RegisterUserEvent(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                ),
                              );
                        }
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
    );
  }
}
