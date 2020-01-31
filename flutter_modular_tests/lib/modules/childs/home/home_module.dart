import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_modular_tests/modules/childs/home/home_bloc.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/home',
          child: (_, args) => HomePage(
            title: 'Home',
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
