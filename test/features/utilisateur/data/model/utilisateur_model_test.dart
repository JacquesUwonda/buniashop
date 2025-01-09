import 'package:flutter_test/flutter_test.dart';
import 'package:watertank/features/utilisateur/data/model/utilisateur_model.dart';

void main(){
  test('devrait convertir de JSON vers [UtilisateurModel]', () async{
    var objetAConvertir = {
      "id_utilisateur":1,
      "email":"test@gmail.com",
      "auth_id":"aaaa",
    };

    var resultatAttendu = UtilisateurModel(idUtilisateur: 1,email: "test@gmail.com",authId: "aaaa");
    var resultat = UtilisateurModel.fromJSON(objetAConvertir);
    expect(resultat, resultatAttendu);
  });

  test('devrait convertir de [UtilisateurModel] vers JSON', () async{
    var objetAConvertir = UtilisateurModel(idUtilisateur: 1,email: "test@gmail.com",authId: "aaaa");
    var resultatAttendu = {
      "id_utilisateur":1,
      "email":"test@gmail.com",
      "auth_id":"aaaa",
    };
    var resultat = objetAConvertir.toJSON();
    expect(resultat, resultatAttendu);
  });
}