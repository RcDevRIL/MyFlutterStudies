import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/modules/app_bloc.dart';
import 'package:flutter_modular_tests/modules/app_module.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  ApplicationInitializationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = AppModule.to.get<ApplicationInitializationBloc>();
    bloc.add(ApplicationInitializationEvent.start);
  }

  @override
  Widget build(BuildContext pageContext) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationInitializationBloc>(builder:
                  (BuildContext context, ApplicationInitializationBloc value) {
                if (value.state.isInitialized)
                  WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Modular.to.pushReplacementNamed('/home'));
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.black,
                    value: value.state.progress / 100,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
