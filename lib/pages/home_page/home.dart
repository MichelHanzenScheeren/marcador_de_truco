import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/game_history.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/init_game.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = HomeController();
  List<StatefulWidget> tabs;

  @override
  void initState() {
    super.initState();
    tabs = [InitGame(homeController), GameHistory(homeController)];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeController.getDependencies(context);
  }

  @override
  void dispose() {
    homeController.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marcador de Truco",
          style: TextStyle(color: Theme.of(context).textSelectionHandleColor),
        ),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return tabs[homeController.currentPage];
      }),
      bottomNavigationBar: Observer(builder: (context) {
        final theme = Theme.of(context);
        return BottomNavigationBar(
          backgroundColor: theme.primaryColor,
          selectedItemColor: theme.textSelectionHandleColor,
          unselectedItemColor: theme.textSelectionHandleColor.withAlpha(150),
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
