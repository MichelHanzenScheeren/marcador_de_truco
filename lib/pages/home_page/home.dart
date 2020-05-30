import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/game_history.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/init_game.dart';
import '../../controllers/home_controller.dart';
import '../../models/my_theme.dart';

class Home extends StatefulWidget {
  final homeController = HomeController();
  final MyTheme myTheme;
  Home(this.myTheme);

  @override
  _HomeState createState() => _HomeState(homeController);
}

class _HomeState extends State<Home> {
  final HomeController homeController;
  _HomeState(this.homeController);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeController.getMyDatabase(context);
  }

  @override
  void dispose() {
    homeController.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [InitGame(homeController), GameHistory(homeController)];
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
        return tabs[homeController.currentPage];
      }),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          currentIndex: homeController.currentPage,
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
          onTap: homeController.setPage,
        );
      }),
    );
  }
}
