import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:sqflite/sqflite.dart';

const String appSettingsTable = "appSettingsTable";
const String trucoTable = "trucoTable";
const String playerTable = "playerTable";
const String roundTable = "roundTable";

class MyDatabase {
  DatabaseConnection connection;

  MyDatabase(this.connection);

  void closeDb() async {
    await connection.closeDb();
  }

  Future save(Truco truco) async {
    Database db = await connection.getDatabase;
    int trucoID = await db.insert(trucoTable, truco.toMap());
    await db.insert(playerTable, truco.player1.toMap(trucoID));
    await db.insert(playerTable, truco.player2.toMap(trucoID));

    final batch = db.batch();
    truco.rounds.forEach((element) {
      batch.insert(roundTable, element.toMap(trucoID));
    });
    await batch.commit();
  }

  Future<List> getAll() async {
    Database db = await connection.getDatabase;
    List<Map> trucoMaps = await db.query(trucoTable, orderBy: "startDate");
    List<Map> playerMaps = await db.query(playerTable);

    return List<Truco>.generate(trucoMaps.length, (i) {
      return Truco.fromMap(
        trucoMaps[i],
        obtainPlayer("p1", playerMaps, trucoMaps[i]),
        obtainPlayer("p2", playerMaps, trucoMaps[i]),
      );
    });
  }

  Player obtainPlayer(String number, List<Map> playerMaps, Map trucoMap) {
    return Player.fromMap(playerMaps
        .where((element) =>
            element["trucoID"] == trucoMap["trucoID"] &&
            element["playerNumber"] == number)
        .first);
  }

  Future<List<Round>> getRounds(int trucoID) async {
    await Future.delayed(Duration(seconds: 1));
    Database db = await connection.getDatabase;
    List<Map> rounds = await db
        .rawQuery("SELECT * FROM $roundTable WHERE trucoID = $trucoID;");

    return List<Round>.generate(rounds.length, (i) => Round.fromMap(rounds[i]));
  }

  Future deleteRegister(int trucoID) async {
    await Future.delayed(Duration(milliseconds: 500));
    Database db = await connection.getDatabase;
    await db.delete(trucoTable, where: "trucoID = ?", whereArgs: [trucoID]);
  }

  Future<Map> getSettings() async {
    Database db = await connection.getDatabase;
    String query = "SELECT * FROM $appSettingsTable;";
    List<Map> settings = await db.rawQuery(query);

    return settings.length > 0 ? settings[0] : null;
  }

  Future saveSetting(Map map) async {
    Database db = await connection.getDatabase;
    await db.update("$appSettingsTable", map);
  }
}
