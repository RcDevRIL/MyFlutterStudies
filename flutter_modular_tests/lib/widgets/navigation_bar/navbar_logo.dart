import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: FlatButton(
          splashColor: Colors.transparent,
          color: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => Modular.to
              .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/')),
          child: Image.asset('assets/img/icons/flutter_logo.png')),
    );
  }
}
