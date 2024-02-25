import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user.dart';

abstract class LoginDatasource {
  Future<User> login(String email, String password);
}
