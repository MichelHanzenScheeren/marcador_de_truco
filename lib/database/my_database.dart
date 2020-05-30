import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String trucoTable = "trucoTable";
const String playerTable = "playerTable";
const String roundTable = "roundTable";

class MyDatabase {
  Database _database;

  Future<Database> get getDatabase async {
    if (_database == null) {
      await _initDatabase();
    }
    return _database;
  }

  Future _initDatabase() async {
    final String dataBasePath = await getDatabasesPath();
    final String path = join(dataBasePath, "contacts.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersion) async {
      await db.execute("CREATE TABLE $trucoTable(" +
          "id INTEGER PRIMARY KEY AUTOINCREMENT," +
          "maxPoints INTEGER," +
          "startDate TEXT," +
          "finalDate TEXT" +
          ");");
      await db.execute("CREATE TABLE $playerTable(" +
          "id INTEGER PRIMARY KEY," +
          "trucoID INTEGER," +
          "points INTEGER," +
          "image TEXT," +
          "imageType TEXT," +
          "name TEXT," +
          "playerNumber TEXT," +
          "FOREIGN KEY (trucoID) REFERENCES $trucoTable (id)" +
          ");");
      await db.execute("CREATE TABLE $roundTable(" +
          "id INTEGER PRIMARY KEY," +
          "trucoID INTEGER," +
          "dateTime TEXT," +
          "playerNumber TEXT," +
          "points INTEGER," +
          "FOREIGN KEY (trucoID) REFERENCES $trucoTable (id)" +
          ");");
    });
  }

  Future closeDb() async {
    Database db = await getDatabase;
    await db.close();
  }
}
