import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/game.dart';
import 'package:marcadordetruco/statics/my_players.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  bool isLoading = false;

  PlayerDescription p1Desc = MyPlayers.p1Description;
  PlayerDescription p2Desc = MyPlayers.p2Description;
  String maxPoints = "12";

  @action
  void setPage(int number) => currentPage = number;

  @action
  void setLoading(bool condition) => isLoading = condition;

  void setMaxPoints(String value) => maxPoints = value;

  Game initGame() {
    GameController controller = GameController(Truco(
      player1: Player(description: p1Desc),
      player2: Player(description: p2Desc),
      maxPoints: int.parse(maxPoints),
    ));
    final gamePage = Game(controller);
    return gamePage;
  }
}
