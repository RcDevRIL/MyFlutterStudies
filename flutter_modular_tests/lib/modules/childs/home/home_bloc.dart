import 'package:flutter/material.dart';

/// Simple Bloc to demonstrate the capabilities of the [ChangeNotifier] class.
///
/// @author RcDevRIL
/// @version 0.1.1-RELEASE
class HomeBloc extends ChangeNotifier {
  int counter = 0;
  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    counter--;
    notifyListeners();
  }
}
