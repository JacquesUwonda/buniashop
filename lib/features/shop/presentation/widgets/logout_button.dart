import 'package:buniashop/core/routes/routes_names.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';
import 'package:buniashop/utils/alerts_and_loader.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutUserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.pushReplacementNamed(context, RouteNames.login);
        } else if (state is UserEchecState) {
          showSnackBar(context, state.reason, errorColor, dismiss);
        }
      },
      child: BlocBuilder<LogoutUserBloc, UserState>(
        builder: (context, state) {
          var loading = false;
          if (state is UserInitialState) {
          } else if (state is UserLoadingState) {
            loading = true;
          }
          return buildLogoutButton(context, loading);
        },
      ),
    );
  }
}

Widget buildLogoutButton(BuildContext context, bool loading) {
  if (loading) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Loadings.loadingAnimationWidget,
        ],
      ),
    );
  }
  return ElevatedButton(
    onPressed: () {
      Allert.showConfirmation(
        context,
        () {
          context.read<LogoutUserBloc>().add(
                LogoutUserEvent(),
              );
        },
        confirmLogoutTitle,
        confirmLogoutText,
      );
    },
    child: Text(logoutText),
  );
}
