import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/pages/game_page/rounds_tab/rounds_tab.dart';
import './points_tab/points_tab.dart';
import '../../controllers/game_controller.dart';

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
    super.didChangeDependencies();
    gameController.victoryReaction(this.context);
  }

  @override
  void dispose() {
    gameController.dispose();
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
                gameController.games[0],
                gameController.player1Wins,
                gameController.player2Wins,
              );
            }),
            RoundsTab(gameController.getCurrent),
          ],
        ),
      ),
    );
  }
}
