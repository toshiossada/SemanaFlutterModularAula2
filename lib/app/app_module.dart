import 'package:aula_0/app/app_controller.dart';
import 'package:aula_0/app/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/other/other_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/other/:name',
            child: (_, args) => OtherPage(
                  name: args.params['name'],
                )),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
