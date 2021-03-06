import 'package:flutter/material.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/app_settings.dart';
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
  AppSettings appSettings;

  @action
  void setPage(int number) => currentPage = number;

  @action
  void setLoading(bool condition) => isLoading = condition;

  void setMaxPoints(String value) => maxPoints = value;

  String validateName(String value) {
    value = value.trim();
    if (value == "") {
      return "O nome não pode ser vazio...";
    } else if (value.replaceAll(" ", "").length == 0) {
      return "Nome inválido!";
    } else if (value.length > 20) {
      return "Máx. 20 caracters...";
    } else if (p1Desc.name.trim() == value && p2Desc.name.trim() == value) {
      return "Os nomes devem ser diferentes!";
    } else {
      return null;
    }
  }

  String validateMaxPoints(String value) {
    if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return "O valor informado deve ser um número inteiro maior do que 0.";
    } else if (int.parse(value) == 0) {
      return "O valor informado deve ser um número inteiro maior do que 0.";
    } else {
      return null;
    }
  }

  Game initGame() {
    GameController controller = GameController(
      Truco(
        player1: Player(description: p1Desc),
        player2: Player(description: p2Desc),
        maxPoints: int.parse(maxPoints),
      ),
    );
    return Game(controller);
  }

  void getDependencies(BuildContext context) {
    if (myDatabase == null)
      myDatabase = MyDatabase(Provider.of<DatabaseConnection>(context));

    if (appSettings == null) appSettings = Provider.of<AppSettings>(context);
  }

  void closeDatabase() {
    myDatabase.closeDb();
  }

  @action
  Future getData() async {
    setLoading(true);
    games.clear();
    List<Truco> aux = await myDatabase.getAll();
    aux.reversed.forEach((element) => games.add(element));
    setLoading(false);
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
