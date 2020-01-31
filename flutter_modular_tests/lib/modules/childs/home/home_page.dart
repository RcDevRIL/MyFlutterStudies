import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' show Consumer;
import 'package:flutter_modular_tests/modules/childs/home/home_bloc.dart'
    show HomeBloc;
import 'package:flutter_modular_tests/modules/childs/home/home_module.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<HomeBloc>(
                builder: (context, value) => Text(
                      '${value.counter}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () => HomeModule.to.get<HomeBloc>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
