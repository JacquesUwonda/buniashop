import 'package:buniashop/dependency_injection.dart';
import 'package:buniashop/features/user/dependency_injection.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

import '../../features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import '../../features/user/presentation/authentification/logic/cubit/showpassword_cubit.dart';

List<SingleChildWidget> blocProviders({required BuildContext context}) {
  return [
    // Blocs
    BlocProvider<AuthentificateUserBloc>(
      create: (BuildContext context) => sl<AuthentificateUserBloc>(),
    ),
    BlocProvider<RegisterUserBloc>(
      create: (BuildContext context) => sl<RegisterUserBloc>(),
    ),
    BlocProvider<LogoutUserBloc>(
      create: (BuildContext context) => sl<LogoutUserBloc>(),
    ),
    // Cubits
    BlocProvider<ShowpasswordCubit>(
      create: (BuildContext context) => ShowpasswordCubit(),
    ),
  ];
}
