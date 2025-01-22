import 'package:buniashop/core/exceptions/exceptions.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/model/user_model.dart';
import 'package:buniashop/features/user/data/repository/user_data_repository.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserDatasource extends Mock implements UserDatasource {}

void main() {
  late MockUserDatasource datasource;
  late UserDataRepository userDataRepository;

  setUp(() {
    datasource = MockUserDatasource();
    userDataRepository = UserDataRepository(datasource);
  });

  group('[UserDataRepository.login]', () {
    test('should return a valid User when login is successful', () async {
      // Données simulées
      const email = 'test@gmail.com';
      const password = 'password123';
      final userModel = UserModel(token: 'abc123', id: 'user001', email: email);

      // Mock de la méthode login
      when(() => datasource.login(email, password))
          .thenAnswer((_) async => userModel);

      // Appel et vérification
      final result = await userDataRepository.login(email, password);
      expect(result, isA<User>());
      expect(result.token, userModel.token);
      expect(result.id, userModel.id);
      expect(result.email, userModel.email);
    });

    test('should throw a ServerException when login fails', () async {
      // Données simulées
      const email = 'test@gmail.com';
      const password = 'password123';

      // Mock de l'exception
      when(() => datasource.login(email, password))
          .thenThrow(ServerException(reason: 'Erreur serveur'));

      // Appel et vérification
      expect(
        () => userDataRepository.login(email, password),
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('[UserDataRepository.register]', () {
    test('should return a valid User when registration is successful',
        () async {
      // Données simulées
      const email = 'test@gmail.com';
      const password = 'password123';
      final userModel = UserModel(token: 'xyz123', id: 'user002', email: email);

      // Mock de la méthode register
      when(() => datasource.register(email, password))
          .thenAnswer((_) async => userModel);

      // Appel et vérification
      final result = await userDataRepository.register(email, password);
      expect(result, isA<User>());
      expect(result.token, userModel.token);
      expect(result.id, userModel.id);
      expect(result.email, userModel.email);
    });

    test('should throw a ServerException when registration fails', () async {
      // Données simulées
      const email = 'test@gmail.com';
      const password = 'password123';

      // Mock de l'exception
      when(() => datasource.register(email, password))
          .thenThrow(ServerException(reason: 'Erreur serveur'));

      // Appel et vérification
      expect(
        () => userDataRepository.register(email, password),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
