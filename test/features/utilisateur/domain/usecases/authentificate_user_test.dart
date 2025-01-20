// import 'package:buniashop/core/result/result.dart';
// import 'package:buniashop/features/user/domain/repository/user_repository.dart';
// import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:flutter_test/flutter_test.dart';

// class MockUserRepository extends Mock implements UserRepository {}

// void main() {
//   late MockUserRepository repository;
//   late AuthentificateUser authentificateUser;
//   setUp(() {
//     repository = MockUserRepository();
//     authentificateUser = AuthentificateUser(repository: repository);
//   });

//   test('calling [UserRepository.authentificateUser]', () async {
//     when(() => repository.authentificateUser("test@gmail.com", "aaaa"))
//         .thenAnswer((_) async => Succes<int>(value: 1));
//     await authentificateUser("test@gmail.com", "aaaa");
//     verify(() => repository.authentificateUser("test@gmail.com", "aaaa"));
//   });
// }
