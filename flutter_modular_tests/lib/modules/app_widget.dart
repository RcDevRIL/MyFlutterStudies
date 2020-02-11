import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_modular_tests/widgets/navigation_drawer/navigation_drawer.dart';

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
      navigatorKey: Modular.navigatorKey,
      builder: (context, child) => Scaffold(
        drawer:
            /* sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ?  */
            NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
