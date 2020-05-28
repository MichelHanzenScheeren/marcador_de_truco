import 'package:flutter/material.dart';
import 'package:marcadordetruco/pages/victory_page/victory_page.dart';
import 'package:mobx/mobx.dart';
import '../models/player.dart';
import '../models/truco.dart';

part 'game_controller.g.dart';

class GameController = _GameControllerBase with _$GameController;

abstract class _GameControllerBase with Store {
  ObservableList<Truco> games = ObservableList<Truco>();

  @observable
  int player1Wins = 0;

  @observable
  int player2Wins = 0;

  ReactionDisposer disposer;

  @action
  incrementWins(Players playerNumber) {
    if (playerNumber == Players.p1) {
      player1Wins++;
    } else {
      player2Wins++;
    }
  }

  @action
  void addGame(Truco truco) {
    games.insert(0, truco);
  }

  Truco get getCurrent => games[0];

  void victoryReaction(BuildContext pageContext) {
    disposer = reaction((_) => getCurrent.finishedGame, (finishGame) async {
      if (finishGame) {
        incrementWins(getCurrent.getWinner.playerNumber);
        Truco truco = await Navigator.of(pageContext).push(MaterialPageRoute(
          builder: (context) => VictoryPage(truco: games[0]),
        ));
        if (truco != null) {
          addGame(truco);
        }
      }
    });
  }

  void dispose() {
    disposer?.call();
    getCurrent?.reset();
  }
}
