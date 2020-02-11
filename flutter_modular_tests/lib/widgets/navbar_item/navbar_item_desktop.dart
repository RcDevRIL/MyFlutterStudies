import 'package:flutter/material.dart';
import 'package:flutter_modular_tests/models/navbar_item_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
