import './truco.dart';
import 'package:mobx/mobx.dart';
part 'game_model.g.dart';

class GameModel = _GameModelBase with _$GameModel;

abstract class _GameModelBase with Store {
  ObservableList<Truco> games = ObservableList<Truco>();

  @action
  void addGame(Truco truco) {
    games.insert(0, truco);
  }
}
