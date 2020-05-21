import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import './hystory_tab/history_tab.dart';
import './points_tab/points_tab.dart';
import '../../models/truco.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final Truco truco = Truco(
    player1: Player(name: "Nós", playerNumber: Players.p1),
    player2: Player(name: "Eles", playerNumber: Players.p2),
  );

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
              Tab(
                icon: Icon(Icons.play_circle_filled),
              ),
              Tab(icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PointsTab(truco),
            HistoryTab(truco),
          ],
        ),
      ),
    );
  }
}
