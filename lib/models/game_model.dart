import './player.dart';
import './truco.dart';
import 'package:mobx/mobx.dart';
part 'game_model.g.dart';

class GameModel = _GameModelBase with _$GameModel;

abstract class _GameModelBase with Store {
  ObservableList<Truco> games = ObservableList<Truco>();

  @observable
  int player1Wins = 0;

  @observable
  int player2Wins = 0;

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
}
