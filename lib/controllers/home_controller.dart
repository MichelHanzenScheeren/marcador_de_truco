import 'package:flutter/cupertino.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/game.dart';
import 'package:marcadordetruco/statics/my_players.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  bool isLoading = false;

  ObservableList<Truco> games = ObservableList<Truco>();

  PlayerDescription p1Desc = MyPlayers.p1Description;
  PlayerDescription p2Desc = MyPlayers.p2Description;
  String maxPoints = "12";

  MyDatabase myDatabase;

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

  void getMyDatabase(BuildContext context) {
    if (myDatabase == null) {
      myDatabase = MyDatabase(Provider.of<DatabaseConnection>(context));
    }
  }

  void closeDatabase() {
    myDatabase.closeDb();
  }

  @action
  Future<ObservableList<Truco>> getData() async {
    games.clear();
    List<Truco> aux = await myDatabase.getAll();
    aux.sort((a, b) => a.startDate.compareTo(b.startDate));
    aux.forEach((element) => games.add(element));
    return games;
  }

  Future<List<Round>> getRounds(int trucoID) async {
    return await myDatabase.getRounds(trucoID);
  }

  Future deleteRegister(int trucoID) async {
    setLoading(true);
    await myDatabase.deleteRegister(trucoID);
    games.removeWhere((element) => element.trucoID == trucoID);
    setLoading(false);
  }
}
