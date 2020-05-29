import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/pages/game_page/rounds_tab/rounds_tab.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:mobx/mobx.dart';
import './points_tab/points_tab.dart';

class Game extends StatefulWidget {
  final GameController gameController;
  Game(this.gameController);

  @override
  _GameState createState() => _GameState(gameController);
}

class _GameState extends State<Game> {
  final GameController gameController;
  ReactionDisposer myDisposer;
  _GameState(this.gameController);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myDisposer = reaction((_) => gameController.finishedGame, (result) async {
      if (result) {
        gameController.incrementWins();
        bool newGame = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VictoryPage(truco: gameController.currentGame),
        ));
        if (newGame)
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Marcador de truco"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).hintColor,
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
    );
  }
}
