import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Simple [MaterialApp] that will be the root of our application.
///
/// @author RcDevRIL
/// @version 0.1.2
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for flutter_modular package',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      navigatorKey: Modular.navigatorKey,
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
