import 'package:either_dart/either.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/external/errors/error.dart';

abstract class LoginDatasource {
  Future<Either<ServerException, UserEntity>> login(
      String email, String password);
}
