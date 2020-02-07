import 'package:flutter/material.dart';
import 'package:flutter_modular_tests/widgets/navbar_item/navbar_item.dart';

import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavBarLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NavBarItem('Episodes', '/episodes'),
                SizedBox(
                  width: 60,
                ),
                NavBarItem('About', '/about'),
                SizedBox(
                  width: 60,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
