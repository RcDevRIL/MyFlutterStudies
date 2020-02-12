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
        height: MediaQuery.of(context).size.height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavBarLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).size.height / 5) * 0.1),
                  child: NavBarItem(
                    'My Widgets',
                    '/home/widgets',
                    icon: Icons.wb_iridescent,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).size.height / 5) * 0.1),
                  child: NavBarItem(
                    'My Studies',
                    '/home/studies',
                    icon: Icons.assignment,
                  ),
                ),
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
