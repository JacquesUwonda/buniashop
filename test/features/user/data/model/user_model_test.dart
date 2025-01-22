import 'package:buniashop/features/user/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel Tests', () {
    test('Converting from JSON to UserModel', () {
      // Données JSON simulées
      var jsonInput = {
        "token": "abcd1234",
        "id": "user001",
        "email": "test@gmail.com",
      };

      // Résultat attendu
      var expectedModel = UserModel(
        token: "abcd1234",
        id: "user001",
        email: "test@gmail.com",
      );

      // Conversion JSON -> UserModel
      var result = UserModel.fromJson(jsonInput);

      // Vérification
      expect(result.token, expectedModel.token);
      expect(result.id, expectedModel.id);
      expect(result.email, expectedModel.email);
    });

    test('Converting from UserModel to User Entity', () {
      // Modèle UserModel simulé
      var userModel = UserModel(
        token: "abcd1234",
        id: "user001",
        email: "test@gmail.com",
      );

      // Résultat attendu sous forme d'entité
      var expectedEntity = userModel.toEntity();

      // Conversion UserModel -> User Entity
      var result = userModel.toEntity();

      // Vérification
      expect(result.token, expectedEntity.token);
      expect(result.id, expectedEntity.id);
      expect(result.email, expectedEntity.email);
    });
  });
}
