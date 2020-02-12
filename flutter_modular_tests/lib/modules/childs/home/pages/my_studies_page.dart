import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_bloc.dart';
import 'package:flutter_modular_tests/modules/childs/home/home_module.dart';
import 'package:flutter_modular_tests/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_modular_tests/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Simple Page that shows some real case examples.
///
/// @author RcDevRIL
/// @version 0.1.2
class MyStudiesPage extends StatelessWidget {
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
                child: ListView(
                  padding: const EdgeInsets.all(12.0),
                  children: <Widget>[
                    StudyCard(
                      title: 'Basic flutter sample on state management.',
                      subtitle:
                          'This one uses ChangeNotifier class to handle counters count.',
                      study: ResponsiveBuilder(
                        builder: (context, size) => size.screenSize.width >= 550
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'You have pushed the button this many times:',
                                        ),
                                        Consumer<HomeBloc>(
                                          builder: (context, value) => Text(
                                            '${value.counter}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        RaisedButton(
                                          onPressed: () => HomeModule.to
                                              .get<HomeBloc>()
                                              .increment(),
                                          child: Icon(Icons.add),
                                        ),
                                        RaisedButton(
                                          onPressed: () => HomeModule.to
                                              .get<HomeBloc>()
                                              .decrement(),
                                          child: Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'You have pushed the button this many times:',
                                    ),
                                    Consumer<HomeBloc>(
                                      builder: (context, value) => Text(
                                        '${value.counter}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    RaisedButton(
                                      onPressed: () => HomeModule.to
                                          .get<HomeBloc>()
                                          .increment(),
                                      child: Icon(Icons.add),
                                    ),
                                    RaisedButton(
                                      onPressed: () => HomeModule.to
                                          .get<HomeBloc>()
                                          .decrement(),
                                      child: Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget study;

  const StudyCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.study,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.black, fontSize: 22.0),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          study,
        ],
      ),
    );
  }
}
