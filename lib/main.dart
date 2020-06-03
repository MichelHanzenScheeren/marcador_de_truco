import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:provider/provider.dart';
import './models/my_theme.dart';
import './pages/home_page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final DatabaseConnection connection = DatabaseConnection();
    final MyTheme myTheme = MyTheme(connection);
    return MultiProvider(
      providers: [
        Provider<DatabaseConnection>(create: (context) => connection),
        Provider<MyTheme>(create: (context) => myTheme),
      ],
      child: Observer(builder: (context) {
        return MaterialApp(
          title: 'Ás de Espada',
          debugShowCheckedModeBanner: false,
          theme: myTheme.getTheme,
          home: Home(),
        );
      }),
    );
  }
}

// final db = Provider.of<DatabaseConnection>(context);
// db.deleteDb();
