import 'package:buniashop/dependency_injection.dart';
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

    // Cubits
    BlocProvider<ShowpasswordCubit>(
      create: (BuildContext context) => ShowpasswordCubit(),
    ),
  ];
}
