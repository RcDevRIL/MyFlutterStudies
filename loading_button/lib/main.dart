import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.dev/testing/ for more info.
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomLoadingButton(),
            Column(
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomLoadingButton extends StatefulWidget {
  final Widget child;

  CustomLoadingButton({
    Key key,
    this.child = const Text(
      'My button is awesome',
      softWrap: false,
    ),
  }) : super(key: key);

  @override
  _CustomLoadingButtonState createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  double _width = 250;
  bool _isCollapsed = false;
  ShapeBorder _shapeBorder;

  @override
  void initState() {
    super.initState();
    _shapeBorder = RoundedRectangleBorder();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
      width: _width,
      constraints: BoxConstraints(
        maxHeight: 50.0,
      ),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            if (_isCollapsed) {
              _width = 250.0;
              _shapeBorder = RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black26,
                  width: 1.0,
                ),
              );
            } else {
              _width = 50.0;
              _shapeBorder = CircleBorder(
                side: BorderSide(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              );
            }
            _isCollapsed = !_isCollapsed;
          });
        },
        color: Colors.blueGrey,
        elevation: 2.0,
        focusElevation: 1.0,
        hoverColor: Colors.lightBlueAccent,
        shape: _shapeBorder,
        textColor: Colors.white,
        child: _isCollapsed ? CircularProgressIndicator() : widget.child,
      ),
    );
  }
}
