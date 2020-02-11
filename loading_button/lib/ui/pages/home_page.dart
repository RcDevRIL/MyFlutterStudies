import 'package:flutter/material.dart';
import 'package:loading_button/ui/widgets/custom_loading_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network(
            'https://symbols.getvecta.com/stencil_80/63_flutter-icon.dec5447e22.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buttonShowCaseList.elementAt(0),
            SizedBox(
              height: 25.0,
            ),
            buttonShowCaseList.elementAt(1),
          ],
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
