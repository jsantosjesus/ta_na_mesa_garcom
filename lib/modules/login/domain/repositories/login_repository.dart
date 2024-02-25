import 'package:dartz/dartz.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';

abstract class LoginRepository {
  Future<Either<ErrorLogin, UserEntity>> login(String email, String password);
}
