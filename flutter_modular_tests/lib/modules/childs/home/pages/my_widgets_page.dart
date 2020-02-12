import 'package:flutter/material.dart';
import 'package:flutter_modular_tests/widgets/custom_loading_button.dart';
import 'package:flutter_modular_tests/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_modular_tests/widgets/navigation_drawer/navigation_drawer.dart';

/// Simple Page that show some Widgets I have implemented.
///
/// @author RcDevRIL
/// @version 0.1.2
class MyWidgetsPage extends StatelessWidget {
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white70,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              style: BorderStyle.solid,
                              color: const Color(0xFFB3E5FC),
                              width: 1.0,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Animated button with loading indicator.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                            ),
                                      ),
                                      Text(
                                        'This one uses AnimatedContainer class to handle all animations.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                buttonShowCaseList.elementAt(0),
                                SizedBox(
                                  height: 25.0,
                                ),
                                buttonShowCaseList.elementAt(1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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

List<CustomLoadingButton> buttonShowCaseList = [
  CustomLoadingButton(
    buttonText: 'My button is awesome',
    beginBackgroundColor: const Color(0xFF607D8B),
    endBackgroundColor: const Color(0xAFAF8F5F),
    borderColor: Colors.deepPurple,
    iconAfterComplete: Icons.save_alt,
    iconColor: Colors.deepPurpleAccent,
    textColor: Colors.lightBlueAccent,
  ),
  CustomLoadingButton(
    buttonText: 'This one too !!!',
    beginBackgroundColor: Colors.white,
    endBackgroundColor: const Color(0xFF607D8B),
    borderColor: Colors.redAccent,
    iconAfterComplete: Icons.delete,
    iconColor: const Color(0xCCFFFFFF),
    textColor: const Color(0xFF000000),
  ),
];
