import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/database/truco_db.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
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

  TrucoDb trucoDb;

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

  initTrucoDb(BuildContext context) {
    if (trucoDb == null) {
      trucoDb = TrucoDb(Provider.of<MyDatabase>(context));
    }
  }

  void save() async {
    setIsSaving(true);
    currentGame.id = await trucoDb.save(currentGame);
    setIsSaving(false);
  }
}
