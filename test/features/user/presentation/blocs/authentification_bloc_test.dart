import 'package:bloc_test/bloc_test.dart';
import 'package:buniashop/core/services/localUserData/local_storage.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthentificateUser extends Mock implements AuthentificateUser {}

class MockRegisterUser extends Mock implements RegisterUser {}

class MockLogoutUser extends Mock implements LogoutUser {}

class MockLocalStorageService extends Mock implements LocalStorageService {}

void main() {
  late MockAuthentificateUser mockAuthentificateUser;
  late MockRegisterUser mockRegisterUser;
  late MockLogoutUser mockLogoutUser;
  late MockLocalStorageService mockLocalStorage;

  setUp(() {
    mockAuthentificateUser = MockAuthentificateUser();
    mockRegisterUser = MockRegisterUser();
    mockLogoutUser = MockLogoutUser();
    mockLocalStorage = MockLocalStorageService();
  });

  group("AuthentificateUserBloc Tests", () {
    blocTest<AuthentificateUserBloc, UserState>(
      "emits [UserLoadingState, UserSuccess] when login is successful",
      build: () => AuthentificateUserBloc(
        loginUser: mockAuthentificateUser,
        localStorage: mockLocalStorage,
      ),
      act: (bloc) => bloc.add(AuthentificateUserEvent(
        email: "test@gmail.com",
        password: "password",
      )),
      setUp: () {
        when(() => mockAuthentificateUser.call(any(), any())).thenAnswer(
          (_) async => User(id: "1", email: "test@gmail.com", token: "abc123"),
        );
        when(() => mockLocalStorage.saveString(any(), any())).thenAnswer(
          (_) async {},
        );
      },
      expect: () => [
        UserLoadingState(),
        UserSuccess(
          result: User(id: "1", email: "test@gmail.com", token: "abc123"),
        ),
      ],
    );

    blocTest<AuthentificateUserBloc, UserState>(
      "emits [UserLoadingState, UserEchecState] when login fails",
      build: () => AuthentificateUserBloc(
        loginUser: mockAuthentificateUser,
        localStorage: mockLocalStorage,
      ),
      act: (bloc) => bloc.add(AuthentificateUserEvent(
        email: "test@gmail.com",
        password: "password",
      )),
      setUp: () {
        when(() => mockAuthentificateUser.call(any(), any())).thenThrow(
          Exception("Server Error"),
        );
      },
      expect: () => [
        UserLoadingState(),
        UserEchecState(reason: "Server Error"),
      ],
    );
  });

  group("RegisterUserBloc Tests", () {
    blocTest<RegisterUserBloc, UserState>(
      "emits [UserLoadingState, UserSuccess] when registration is successful",
      build: () => RegisterUserBloc(registerUser: mockRegisterUser),
      act: (bloc) => bloc.add(RegisterUserEvent(
        email: "test@gmail.com",
        password: "password",
      )),
      setUp: () {
        when(() => mockRegisterUser.call(any(), any())).thenAnswer(
          (_) async => User(id: "1", email: "test@gmail.com", token: "abc123"),
        );
      },
      expect: () => [
        UserLoadingState(),
        UserSuccess(
          result: User(id: "1", email: "test@gmail.com", token: "abc123"),
        ),
      ],
    );

    blocTest<RegisterUserBloc, UserState>(
      "emits [UserLoadingState, UserEchecState] when registration fails",
      build: () => RegisterUserBloc(registerUser: mockRegisterUser),
      act: (bloc) => bloc.add(RegisterUserEvent(
        email: "test@gmail.com",
        password: "password",
      )),
      setUp: () {
        when(() => mockRegisterUser.call(any(), any())).thenThrow(
          Exception("Server Error"),
        );
      },
      expect: () => [
        UserLoadingState(),
        UserEchecState(reason: "Server Error"),
      ],
    );
  });

  group("LogoutUserBloc Tests", () {
    blocTest<LogoutUserBloc, UserState>(
      "emits [UserLoadingState, UserSuccess] when logout is successful",
      build: () => LogoutUserBloc(
        logoutUser: mockLogoutUser,
        localStorage: mockLocalStorage,
      ),
      act: (bloc) => bloc.add(LogoutUserEvent()),
      setUp: () {
        when(() => mockLogoutUser.call()).thenAnswer((_) async {});
        when(() => mockLocalStorage.remove(any())).thenAnswer((_) async {});
      },
      expect: () => [
        UserLoadingState(),
        UserSuccess(result: "Déconnexion réussie"),
      ],
    );

    blocTest<LogoutUserBloc, UserState>(
      "emits [UserLoadingState, UserEchecState] when logout fails",
      build: () => LogoutUserBloc(
        logoutUser: mockLogoutUser,
        localStorage: mockLocalStorage,
      ),
      act: (bloc) => bloc.add(LogoutUserEvent()),
      setUp: () {
        when(() => mockLogoutUser.call()).thenThrow(Exception("Server Error"));
      },
      expect: () => [
        UserLoadingState(),
        UserEchecState(reason: "Server Error"),
      ],
    );
  });
}
