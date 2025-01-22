import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockRepository;
  late AuthentificateUser authentificateUser;

  setUp(() {
    mockRepository = MockUserRepository();
    authentificateUser = AuthentificateUser(mockRepository);
  });

  group('[AuthentificateUser]', () {
    test('should return a User when authentication is successful', () async {
      const email = 'test@gmail.com';
      const password = 'password123';
      final user = User(token: 'abc123', id: 'user001', email: email);

      when(() => mockRepository.login(email, password))
          .thenAnswer((_) async => user);

      final result = await authentificateUser.call(email, password);
      expect(result, user);
      verify(() => mockRepository.login(email, password)).called(1);
    });

    test('should throw an exception when authentication fails', () async {
      const email = 'test@gmail.com';
      const password = 'password123';

      when(() => mockRepository.login(email, password))
          .thenThrow(Exception('Authentication failed'));

      expect(
        () => authentificateUser.call(email, password),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.login(email, password)).called(1);
    });
  });
}
