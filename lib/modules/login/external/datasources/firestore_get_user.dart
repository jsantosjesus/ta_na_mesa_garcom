import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/infra/models/user_model.dart';

class FirestoreGetUser {
  Future<UserEntity?> getUser(String uid) async {
    // Se o uid for nulo, retorne nulo
    // if (uid == null) {
    //   return Left(ServerException());
    // }

    try {
      // Acesse o Firestore para buscar os dados do usuário
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('usuario').doc(uid).get();

      // Verifique se os dados foram encontrados
      if (snapshot.exists) {
        // Converte os dados do Firestore em um objeto User
        UserEntity usuario =
            UserModel.fromMap(snapshot.data() as Map<String, dynamic>);

        return usuario;
      } else {
        // Se o usuário não existir, retorne null
        return null;
      }
    } catch (e) {
      // Trate quaisquer erros que possam ocorrer durante a busca
      print('Erro ao buscar usuário: $e');
      return null;
    }
  }
}
