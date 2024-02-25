// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:ta_na_mesa_garcom/app_widget.dart';
// import 'package:ta_na_mesa_garcom/modules/login/domain/repositories/login_repository.dart';
// import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase.dart';
// import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase_impl.dart';

// class AppModule extends Module {
//   @override
//   void binds(i) {
//     i.add(LoginRepository as Function);
//     i.add<LoginByEmailPasswordFirebase>(LoginByEmailPasswordFirebaseImpl(repository: repository, validEmailPassword: validEmailPassword))
//   }

//   @override
//   void routes(r) {
//     r.child('/', child: (context) => const AppWidget());
//   }
// }
