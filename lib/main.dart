import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/pages/home_page/home.dart';
import 'package:marcadordetruco/statics/my_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MyTheme myTheme = MyTheme();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Provider(
      create: (_) => myTheme,
      child: Observer(builder: (_) {
        return MaterialApp(
          title: 'Marcador de truco',
          debugShowCheckedModeBanner: false,
          theme: myTheme.getTheme,
          home: Home(),
        );
      }),
    );
  }
}
