import 'package:either_dart/either.dart';
import 'package:ta_na_mesa_garcom/modules/login/external/datasources/firestore_get_user.dart';
import 'package:ta_na_mesa_garcom/modules/login/external/errors/error.dart';
import 'package:ta_na_mesa_garcom/modules/login/infra/datasource/login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';

class FirebaseAuthetication implements LoginDatasource {
  final FirestoreGetUser _firestoreGetUser;

  FirebaseAuthetication(this._firestoreGetUser);

  @override
  Future<Either<ServerException, UserEntity>> login(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      String? userUid = credential.user?.uid;

      if (userUid != null) {
        UserEntity? usuario = await _firestoreGetUser.getUser(userUid);

        if (usuario != null) {
          return Right(usuario);
        } else {
          return Left(ServerException());
        }
      } else {
        return Left(ServerException());
      }
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }

      print(e);
      return Left(ServerException());
    }
  }
}
