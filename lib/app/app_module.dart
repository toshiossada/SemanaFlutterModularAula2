import 'package:aula_0/app/app_controller.dart';
import 'package:aula_0/app/app_widget.dart';
import 'package:aula_0/app/shared/Utils/constants.dart';
import 'package:aula_0/app/shared/repositories/poke_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(repository: i.get<PokeRepository>())),
        Bind((i) => PokeRepository(dio: i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/home', child: (_, args) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
