import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:sqflite/sqflite.dart';

const String trucoTable = "trucoTable";

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

  Future<int> save(Truco truco) async {
    Database db = await myDatabase.getDatabase;
    return await db.insert(trucoTable, toMap(truco));
  }
}
