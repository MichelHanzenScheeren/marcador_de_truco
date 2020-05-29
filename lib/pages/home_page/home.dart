import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/game_history.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/init_game.dart';
import '../../controllers/home_controller.dart';
import '../../models/my_theme.dart';

class Home extends StatefulWidget {
  static final homeController = HomeController();
  final MyTheme myTheme;
  Home(this.myTheme);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tabs = [
    InitGame(Home.homeController),
    GameHistory(Home.homeController)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcador de Truco"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: widget.myTheme.setTheme,
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return tabs[Home.homeController.currentPage];
      }),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          currentIndex: Home.homeController.currentPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              title: Text("Início"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("Histórico"),
            ),
          ],
          onTap: Home.homeController.setPage,
        );
      }),
    );
  }
}
