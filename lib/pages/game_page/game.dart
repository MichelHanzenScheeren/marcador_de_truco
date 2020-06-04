import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/points_tab.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/rounds_tab.dart';

class Game extends StatefulWidget {
  final GameController gameController;
  Game(this.gameController);

  @override
  _GameState createState() => _GameState(gameController);
}

class _GameState extends State<Game> {
  final GameController gameController;
  _GameState(this.gameController);

  @override
  void didChangeDependencies() {
    //gameController.initTrucoDb(context);
    gameController.initVictoryReaction(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => gameController.willPop(context),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Ás de Espada",
              style: TextStyle(color: theme.textSelectionHandleColor),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: theme.textSelectionHandleColor,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.play_circle_filled)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
          ),
          body: Observer(builder: (_) {
            return TabBarView(
              children: <Widget>[
                PointsTab(
                  gameController.currentGame,
                  gameController.player1Wins,
                  gameController.player2Wins,
                ),
                RoundsTab(gameController.currentGame),
              ],
            );
          }),
        ),
      ),
    );
  }
}
