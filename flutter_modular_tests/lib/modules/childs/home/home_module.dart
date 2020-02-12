import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_modular_tests/modules/childs/home/home_bloc.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_page.dart';
import 'package:flutter_modular_tests/modules/childs/home/pages/my_studies_page.dart';
import 'package:flutter_modular_tests/modules/childs/home/pages/my_widgets_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => HomePage(
            title: 'Home',
          ),
        ),
        Router(
          '/studies',
          child: (_, args) => MyStudiesPage(),
        ),
        Router(
          '/widgets',
          child: (_, args) => MyWidgetsPage(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
