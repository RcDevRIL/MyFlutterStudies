import 'package:flutter/material.dart';
import 'package:flutter_modular_tests/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_modular_tests/widgets/navigation_drawer/navigation_drawer.dart';

/// Simple Page that welcome users.
///
/// @author RcDevRIL
/// @version 0.1.2
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: Center(
                  child: Text(
                    'Welcome on MyFlutterStudiesApp!!',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 22.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
