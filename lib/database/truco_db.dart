import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/statics/my_players.dart';
import 'package:sqflite/sqflite.dart';

const String trucoTable = "trucoTable";
const String playerTable = "playerTable";
const String roundTable = "roundTable";

class TrucoDb {
  MyDatabase myDatabase;
  TrucoDb(this.myDatabase);

  Map toMap(Truco truco) {
    Map<String, dynamic> map = {
      "maxPoints": truco.maxPoints,
      "startDate": truco.startDate.toString(),
      "finalDate": truco.finalDate.toString(),
    };
    if (truco.id != null) {
      map["id"] = truco.id;
    }
    return map;
  }

  Truco fromMap(Map map) {
    return Truco(
      id: map["id"],
      player1: Player(description: MyPlayers.p1Description),
      player2: Player(description: MyPlayers.p2Description),
      maxPoints: map["maxPoints"],
      startDate: DateTime.parse(map["startDate"]),
    );
  }

  Future<int> save(Truco truco) async {
    Database db = await myDatabase.getDatabase;
    return await db.insert(trucoTable, toMap(truco));
  }

  Future<List> getAll() async {
    Database db = await myDatabase.getDatabase;
    List<Map> maps = await db.rawQuery("SELECT * FROM $trucoTable");
    List<Truco> trucos = List();
    for (Map m in maps) {
      trucos.add(fromMap(m));
    }
    return trucos;
  }
}
