import 'package:bloc_test/bloc_test.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthentificateUser extends Mock implements AuthentificateUser {}

class MockRegisterUser extends Mock implements RegisterUser {}

void main() {
  late MockAuthentificateUser mockAuthentificateUser;
  late MockRegisterUser mockRegisterUser;

  late AuthentificateUserBloc authentificateUserBloc;
  late RegisterUserBloc registerUserBloc;

  setUp(() {
    mockAuthentificateUser = MockAuthentificateUser();
    mockRegisterUser = MockRegisterUser();

    authentificateUserBloc =
        AuthentificateUserBloc(authentificateUser: mockAuthentificateUser);
    registerUserBloc = RegisterUserBloc(registerUser: mockRegisterUser);
  });

  group('test [AuthentificateUserBloc]', () {
    blocTest('emitting [UserLoadingState,UserSuccess]',
        build: () {
          when(() => mockAuthentificateUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Succes<User>(value: User()));
          return authentificateUserBloc;
        },
        act: (bloc) => authentificateUserBloc.add(
            AuthentificateUserEvent(email: "test@gmail.com", password: "aaaa")),
        expect: () => [UserLoadingState(), UserSuccess(result: User())]);

    blocTest('emitting [UserLoadingState,UserEchecState]',
        build: () {
          when(() => mockAuthentificateUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Echec(reason: "erreur serveur"));
          return authentificateUserBloc;
        },
        act: (bloc) => authentificateUserBloc.add(
            AuthentificateUserEvent(email: "test@gmail.com", password: "aaaa")),
        expect: () =>
            [UserLoadingState(), UserEchecState(raison: "erreur serveur")]);
  });

  group('test [RegisateurEnregistrerBloc]', () {
    blocTest('emitting [UserLoadingState,UserSuccess]',
        build: () {
          when(() => mockRegisterUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Succes<User>(value: User()));
          return registerUserBloc;
        },
        act: (bloc) => registerUserBloc.add(RegisterUserEvent(
            email: "test@gmail.com",
            password: "aaaa",
            confirmPassword: "aaaa")),
        expect: () => [UserLoadingState(), UserSuccess(result: User())]);

    blocTest('emitting [UserLoadingState,UserEchecState]',
        build: () {
          when(() => mockRegisterUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Echec(reason: "server error"));
          return registerUserBloc;
        },
        act: (bloc) => registerUserBloc.add(RegisterUserEvent(
            email: "test@gmail.com",
            password: "aaaa",
            confirmPassword: "aaaa")),
        expect: () =>
            [UserLoadingState(), UserEchecState(raison: "server error")]);

    blocTest('emitting [UserLoadingState,UserEchecState]',
        build: () {
          when(() => mockRegisterUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Echec(reason: "server error"));
          return registerUserBloc;
        },
        act: (bloc) => registerUserBloc
            .add(RegisterUserEvent(email: "test@gmail.com", password: "")),
        expect: () => [
              UserLoadingState(),
              UserEchecState(
                  raison: "erreur: le mot de passe ne doit pas être vide.")
            ]);

    blocTest('emitting [UserLoadingState,UserEchecState]',
        build: () {
          when(() => mockRegisterUser("test@gmail.com", "aaaa"))
              .thenAnswer((_) async => Echec(reason: "server error"));
          return registerUserBloc;
        },
        act: (bloc) => registerUserBloc.add(RegisterUserEvent(
            email: "test@gmail.com",
            password: "aaaa",
            confirmPassword: "bbbb")),
        expect: () => [
              UserLoadingState(),
              UserEchecState(
                  raison: "erreur: les mots de passe ne concordent pas.")
            ]);
  });
}
