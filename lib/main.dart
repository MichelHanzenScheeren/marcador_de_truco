import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/models/app_settings.dart';
import 'package:marcadordetruco/pages/logo_page/logo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final DatabaseConnection connection = DatabaseConnection();
    //connection.deleteDb();
    final AppSettings appSettings = AppSettings(connection);
    return MultiProvider(
      providers: [
        Provider<DatabaseConnection>(create: (context) => connection),
        Provider<AppSettings>(create: (context) => appSettings),
      ],
      child: Observer(builder: (context) {
        return MaterialApp(
          title: 'Ás de Espada',
          debugShowCheckedModeBanner: false,
          theme: appSettings.getTheme,
          home: Logo(),
        );
      }),
    );
  }
}
