import 'package:buniashop/features/shop/presentation/widgets/logout_button.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppDrower extends StatelessWidget {
  const AppDrower({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: textFieldFillColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
