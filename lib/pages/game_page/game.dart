import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/points_tab.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/rounds_tab.dart';
import 'package:marcadordetruco/widgets/custom_appbar.dart';

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
    gameController.initTrucoDb(context);
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
    return WillPopScope(
      onWillPop: () => gameController.willPop(context),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(context, hasBottom: true),
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
