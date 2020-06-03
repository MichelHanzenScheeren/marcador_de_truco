import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String appSettingsTable = "appSettingsTable";
const String trucoTable = "trucoTable";
const String playerTable = "playerTable";
const String roundTable = "roundTable";

class DatabaseConnection {
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
      await db.execute("CREATE TABLE $appSettingsTable(" +
          "appSettingsID INTEGER PRIMARY KEY," +
          "isDarkTheme INTEGER," +
          "isEnabledWakelock INTEGER" +
          ");");
      await db.execute("CREATE TABLE $trucoTable(" +
          "trucoID INTEGER PRIMARY KEY AUTOINCREMENT," +
          "maxPoints INTEGER," +
          "startDate TEXT," +
          "finalDate TEXT" +
          ");");
      await db.execute("CREATE TABLE $playerTable(" +
          "playerID INTEGER PRIMARY KEY," +
          "trucoID INTEGER," +
          "points INTEGER," +
          "image TEXT," +
          "imageType TEXT," +
          "name TEXT," +
          "playerNumber TEXT," +
          "FOREIGN KEY (trucoID) REFERENCES $trucoTable (trucoID)" +
          ");");
      await db.execute("CREATE TABLE $roundTable(" +
          "roundID INTEGER PRIMARY KEY," +
          "trucoID INTEGER," +
          "dateTime TEXT," +
          "playerNumber TEXT," +
          "points INTEGER," +
          "FOREIGN KEY (trucoID) REFERENCES $trucoTable (trucoID)" +
          ");");
      await db.insert(
        "$appSettingsTable",
        {"appSettingsID": 1, "isDarkTheme": 1, "isEnabledWakelock": 1},
      );
    });
  }

  Future closeDb() async {
    Database db = await getDatabase;
    if (db.isOpen) await db.close();
  }

  Future deleteDb() async {
    final String dataBasePath = await getDatabasesPath();
    final String path = join(dataBasePath, "contacts.db");
    await deleteDatabase(path);
  }
}
