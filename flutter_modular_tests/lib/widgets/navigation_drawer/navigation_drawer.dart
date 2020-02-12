import 'package:flutter/material.dart';
import 'package:flutter_modular_tests/widgets/navbar_item/navbar_item.dart';
import 'package:flutter_modular_tests/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem(
            'My Widgets',
            '/home/widgets',
            icon: Icons.wb_iridescent,
          ),
          NavBarItem(
            'My Studies',
            '/home/studies',
            icon: Icons.assignment,
          ),
        ],
      ),
    );
  }
}
