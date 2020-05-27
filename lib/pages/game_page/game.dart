import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/pages/game_page/victory_page/victory_page.dart';
import 'package:mobx/mobx.dart';
import './hystory_tab/history_tab.dart';
import './points_tab/points_tab.dart';
import '../../models/truco.dart';
import '../../models/game_model.dart';
import '../../models/player.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Truco truco = Truco(
    player1: Player(name: "Nós", playerNumber: Players.p1),
    player2: Player(name: "Eles", playerNumber: Players.p2),
  );
  final gameModel = GameModel();
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    gameModel.addGame(truco);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer =
        reaction((_) => gameModel.games[0].finishGame, (finishGame) async {
      if (finishGame) {
        gameModel.incrementWins(gameModel.games[0].getWinner.playerNumber);
        Truco truco = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VictoryPage(truco: gameModel.games[0]),
        ));
        if (truco == null) {
          Navigator.pop(context);
        } else {
          gameModel.addGame(truco);
        }
      }
    });
  }

  @override
  void dispose() {
    disposer.call();
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
        body: SafeArea(
          child: TabBarView(
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
      ),
    );
  }
}
