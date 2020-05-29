import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:mobx/mobx.dart';
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
  void newGame({PlayerDescription p1, PlayerDescription p2, int maxPoints}) {
    Truco truco = Truco(
      player1: Player(description: p1),
      player2: Player(description: p2),
      maxPoints: maxPoints,
    );
    currentGame = truco;
  }

  bool get finishedGame => currentGame.finishedGame;
}
