import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/points_tab.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/rounds_tab.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:marcadordetruco/widgets/custom_page_route.dart';
import 'package:mobx/mobx.dart';

class Game extends StatefulWidget {
  final GameController gameController;
  Game(this.gameController);

  @override
  _GameState createState() => _GameState(gameController);
}

class _GameState extends State<Game> {
  final GameController gameController;
  _GameState(this.gameController);
  ReactionDisposer myDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gameController.initTrucoDb(context);
    myDisposer = reaction((_) => gameController.finishedGame, (result) async {
      if (result) {
        gameController.currentGame.saveFinalDate();
        gameController.incrementWins();
        bool newGame = await Navigator.of(context)
            .push(CustomPageRoute(VictoryPage(gameController: gameController)));
        if (newGame != null && newGame)
          gameController.newGame();
        else
          Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    myDisposer.call();
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
              "Marcador de truco",
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
