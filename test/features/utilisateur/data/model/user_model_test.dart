import 'package:buniashop/features/user/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('converting from JSON to [UserModel]', () async {
    var toConvert = {
      "userId": 1,
      "email": "test@gmail.com",
      "auth_id": "aaaa",
    };

    var finalResult =
        UserModel(userId: 1, email: "test@gmail.com", authId: "aaaa");
    var result = UserModel.fromJSON(toConvert);
    expect(result, finalResult);
  });

  test('converting from [UserModel] to JSON', () async {
    var toConvert =
        UserModel(userId: 1, email: "test@gmail.com", authId: "aaaa");
    var finalResult = {
      "userId": 1,
      "email": "test@gmail.com",
      "auth_id": "aaaa",
    };
    var result = toConvert.toJSON();
    expect(result, finalResult);
  });
}
