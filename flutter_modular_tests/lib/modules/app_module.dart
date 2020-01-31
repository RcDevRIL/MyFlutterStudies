import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/modules/app_bloc.dart';
import 'package:flutter_modular_tests/modules/app_widget.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_module.dart';
import 'package:flutter_modular_tests/modules/pages/init_page.dart';

class AppModule extends MainModule {
  @override
  // Insert here any bloc, dependency to inject in this module
  List<Bind> get binds => [
        Bind((i) => ApplicationInitializationBloc()),
      ];

  @override
  // Define here our routes for this module
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (context, args) => InitializationPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '/home',
          module: HomeModule(),
          transition: TransitionType.noTransition,
        ),
      ];

  @override
  // Define the main Widget of this module
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
