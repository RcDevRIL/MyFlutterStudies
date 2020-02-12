import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/modules/app_bloc.dart';
import 'package:flutter_modular_tests/modules/app_widget.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_module.dart';
import 'package:flutter_modular_tests/modules/pages/init_page.dart';

/// MainModule of this application. This will initialize our app with [flutter_modular](https:/www.pub.dev/packages/flutter_modular)
/// Here is binded a bloc implementation that handles the initialization of the app and make visual feedback from it
/// (Mocked for now with linear progress bar)
///
/// @author RcDevRIL
/// @version 0.1.1-RELEASE
class AppModule extends MainModule {
  @override
  // Insert here any bloc, dependency, service to inject in this module
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
