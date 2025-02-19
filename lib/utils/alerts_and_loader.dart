import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showSnackBar(BuildContext context, String message, Color? backgroundColor,
    String label) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: label,
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {},
    ),
    onVisible: () {},
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Loadings {
  static final loadingAnimationWidget = LoadingAnimationWidget.fourRotatingDots(
    color: productBottonColor,
    size: 30,
  );
}

class Allert {
  static void showConfirmation(BuildContext context, VoidCallback onConfirm,
      String title, String description) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnCancelOnPress: () {},
      btnOkOnPress: onConfirm,
    ).show();
  }
}
