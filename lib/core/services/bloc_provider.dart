import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

import '../../features/user/presentation/authentification/logic/cubit/showpassword_cubit.dart';

List<SingleChildWidget> blocProviders({required BuildContext context}) {
  return [
    //blocs

    //cubits
    BlocProvider<ShowpasswordCubit>(
        //show/hide password
        create: (BuildContext context) => ShowpasswordCubit()),
  ];
}
