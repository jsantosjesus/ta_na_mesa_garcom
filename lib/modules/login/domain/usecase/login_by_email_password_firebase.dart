import 'package:either_dart/either.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';

abstract class LoginByEmailPasswordFirebase {
  Future<Either<ErrorLogin, User>> call(String email, String password);
}
