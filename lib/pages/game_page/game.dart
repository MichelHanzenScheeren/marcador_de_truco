import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/pages/game_page/rounds_tab/rounds_tab.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:mobx/mobx.dart';
import './points_tab/points_tab.dart';

class Game extends StatefulWidget {
  final PlayerDescription p1Description;
  final PlayerDescription p2Description;
  final int maxPoints;
  Game(this.p1Description, this.p2Description, this.maxPoints);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final gameController = GameController();
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    gameController.newGame(
      p1: widget.p1Description,
      p2: widget.p2Description,
      maxPoints: widget.maxPoints,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => gameController.finishedGame, (result) async {
      if (result) {
        gameController.incrementWins();
        bool newGame = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VictoryPage(truco: gameController.currentGame),
        ));
        if (newGame) {
          initGame();
        }
      }
    });
  }

  @override
  void dispose() {
    dispose.call();
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
        body: TabBarView(
          children: <Widget>[
            Observer(builder: (_) {
              return PointsTab(
                gameController.currentGame,
                gameController.player1Wins,
                gameController.player2Wins,
              );
            }),
            Observer(builder: (_) {
              return RoundsTab(gameController.currentGame);
            }),
          ],
        ),
      ),
    );
  }
}
