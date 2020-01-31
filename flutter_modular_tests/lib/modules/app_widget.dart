import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      title: 'Flutter Demo for flutter_modular package',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
