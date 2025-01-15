import 'package:buniashop/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.obscureText,
    required this.suffix,
    required this.prefix,
    required this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String? val) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding = const EdgeInsetsDirectional.only(
    top: 2,
    bottom: 2,
    end: 10,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: Theme.of(context).textTheme.titleSmall,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        iconColor: bottonColor,
        filled: true,
        fillColor: textFieldFillColor,
        suffix: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        contentPadding: contentPadding,
        hintStyle: GoogleFonts.inter(
          color: bottonColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: bottonColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: bottonColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: bottonColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: errorColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: errorColor, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        errorStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: errorColor, fontSize: 12),
      ),
      validator: validator,
    );
  }
}
