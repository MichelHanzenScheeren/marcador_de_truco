import 'package:flutter/material.dart';
import './pages/game_page/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador de truco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: Game(),
    );
  }
}
