import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/pages/game_page/widgets/exit_confirmation.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:marcadordetruco/widgets/custom_page_route.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../models/truco.dart';

part 'game_controller.g.dart';

class GameController = _GameControllerBase with _$GameController;

abstract class _GameControllerBase with Store {
  @observable
  Truco currentGame;

  @observable
  int player1Wins = 0;

  @observable
  int player2Wins = 0;

  @observable
  bool isSaving = false;

  MyDatabase myDatabase;
  ReactionDisposer myDisposer;

  _GameControllerBase(Truco truco) {
    currentGame = truco;
  }

  @action
  incrementWins() {
    Players playerNumber = currentGame.getWinner.description.playerNumber;
    if (playerNumber == Players.p1) {
      player1Wins++;
    } else {
      player2Wins++;
    }
  }

  @action
  void newGame() {
    Truco truco = Truco(
      player1: Player(description: currentGame.player1.description),
      player2: Player(description: currentGame.player2.description),
      maxPoints: currentGame.maxPoints,
    );
    currentGame = truco;
  }

  @action
  setIsSaving(bool condition) => isSaving = condition;

  bool get finishedGame => currentGame.finishedGame;

  void initTrucoDb(BuildContext context) {
    if (myDatabase == null) {
      myDatabase = MyDatabase(Provider.of<DatabaseConnection>(context));
    }
  }

  void initVictoryReaction(BuildContext context) {
    myDisposer = reaction((_) => finishedGame, (haveFinished) async {
      if (haveFinished) applyReaction(context);
    });
  }

  void applyReaction(BuildContext context) async {
    currentGame.saveFinalDate();
    bool startNewGame = await Navigator.of(context).push(
      CustomPageRoute(VictoryPage(gameController: this)),
    );
    if (startNewGame != null && startNewGame == true) {
      incrementWins();
      newGame();
    } else {
      Navigator.pop(context);
    }
  }

  void dispose() => myDisposer.call();

  void save() async {
    setIsSaving(true);
    currentGame.trucoID = await myDatabase.save(currentGame);
    setIsSaving(false);
  }

  Future<bool> willPop(BuildContext context) async {
    if (currentGame != null &&
        !currentGame.finishedGame &&
        (currentGame.player1.points != 0 || currentGame.player2.points != 0)) {
      await showDialog(
        context: context,
        child: ExitConfirmation(),
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
