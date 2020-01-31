import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/modules/app_widget.dart';
import 'package:flutter_modular_tests/pages/home_page.dart';

class AppModule extends MainModule {
  @override
  // Insert here any bloc, dependency to inject in this module
  List<Bind> get binds => [];

  @override
  // Define here our routes for this module
  List<Router> get routers => [
        Router("/",
            child: (_, args) => HomePage(
                  title: 'Home',
                )),
      ];

  @override
  // Define the main Widget of this module
  Widget get bootstrap => AppWidget();
}
