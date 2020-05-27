import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './hystory_tab/history_tab.dart';
import './points_tab/points_tab.dart';
import '../../controllers/game_controller.dart';

class Game extends StatefulWidget {
  final GameController gameModel;
  Game(this.gameModel);

  @override
  _GameState createState() => _GameState(gameModel);
}

class _GameState extends State<Game> {
  final gameModel;
  _GameState(this.gameModel);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gameModel.victoryReaction(this.context);
  }

  @override
  void dispose() {
    gameModel.dispose();
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
              Tab(icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Observer(builder: (_) {
              return PointsTab(
                gameModel.games[0],
                gameModel.player1Wins,
                gameModel.player2Wins,
              );
            }),
            HistoryTab(gameModel),
          ],
        ),
      ),
    );
  }
}
