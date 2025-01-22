import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockRepository;
  late RegisterUser registerUser;

  setUp(() {
    mockRepository = MockUserRepository();
    registerUser = RegisterUser(mockRepository);
  });

  group('[RegisterUser]', () {
    test('should return a User when registration is successful', () async {
      const email = 'test@gmail.com';
      const password = 'password123';
      final user = User(token: 'xyz123', id: 'user002', email: email);

      when(() => mockRepository.register(email, password))
          .thenAnswer((_) async => user);

      final result = await registerUser.call(email, password);
      expect(result, user);
      verify(() => mockRepository.register(email, password)).called(1);
    });

    test('should throw an exception when registration fails', () async {
      const email = 'test@gmail.com';
      const password = 'password123';

      when(() => mockRepository.register(email, password))
          .thenThrow(Exception('Registration failed'));

      expect(
        () => registerUser.call(email, password),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.register(email, password)).called(1);
    });
  });
}
