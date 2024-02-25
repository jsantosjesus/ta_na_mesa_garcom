import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ta_na_mesa_garcom/app_widget.dart';
import 'package:ta_na_mesa_garcom/module_app.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
