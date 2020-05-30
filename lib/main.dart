import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:provider/provider.dart';
import './models/my_theme.dart';
import './pages/home_page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MyTheme myTheme = MyTheme();

  @override
  Widget build(BuildContext context) {
    myTheme.configureOrientation();

    return Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: Observer(builder: (context) {
        return MaterialApp(
          title: 'Marcador de truco',
          debugShowCheckedModeBanner: false,
          theme: myTheme.getTheme,
          home: Home(myTheme),
        );
      }),
    );
  }
}
