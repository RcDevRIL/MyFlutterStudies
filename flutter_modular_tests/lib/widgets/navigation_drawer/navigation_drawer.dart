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
          // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
          // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
          NavBarItem(
            'My Widgets',
            '/widgets',
            icon: Icons.wb_iridescent,
          ),
          NavBarItem(
            'My Studies',
            '/studies',
            icon: Icons.assignment,
          ),
        ],
      ),
    );
  }
}
