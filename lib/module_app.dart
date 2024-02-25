import 'package:flutter_modular/flutter_modular.dart';
import 'package:ta_na_mesa_garcom/app_widget.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase_impl.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/utils/valid_email_password.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<LoginByEmailPasswordFirebase>(LoginByEmailPasswordFirebaseImpl.new);
    i.add<ValidEmailPassword>(ValidEmailPassword.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AppWidget());
  }
}
