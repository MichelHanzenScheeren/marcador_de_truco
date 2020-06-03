import 'package:flutter/material.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:mobx/mobx.dart';
import 'package:wakelock/wakelock.dart';
part 'app_settings.g.dart';

class AppSettings = _AppSettingsBase with _$AppSettings;

abstract class _AppSettingsBase with Store {
  int appSettingsID;

  @observable
  bool isDarkTheme = true;

  @observable
  bool isEnabledWakelock = false;

  MyDatabase myDatabase; //not saved

  _AppSettingsBase(DatabaseConnection connection) {
    myDatabase = MyDatabase(connection);
    validateCurrentSettings();
  }

  fromMap(Map map) {
    appSettingsID = map["appSettingsID"];

    bool auxIsDarkTheme = intToBool(map["isDarkTheme"]);
    if (isDarkTheme != auxIsDarkTheme) _setTheme(auxIsDarkTheme);

    bool auxIsEnabledWakelock = intToBool(map["isEnabledWakelock"]);
    if (auxIsEnabledWakelock != isEnabledWakelock)
      _setWakeLock(auxIsEnabledWakelock);
  }

  Map toMap() {
    Map<String, dynamic> appSettings = {
      "appSettingsID": appSettingsID,
      "isDarkTheme": boolToInt(isDarkTheme),
      "isEnabledWakelock": boolToInt(isEnabledWakelock),
    };
    return appSettings;
  }

  int boolToInt(bool value) => value == false ? 0 : 1;
  bool intToBool(int value) => value == 0 ? false : true;

  Future validateCurrentSettings() async {
    Map values = await myDatabase.getSettings();
    if (values != null) {
      fromMap(values); //atualiza
    }
  }

  @action
  void _setTheme(bool value) => isDarkTheme = value;

  @action
  void _setWakeLock(bool value) {
    isEnabledWakelock = value;
    Wakelock.toggle(on: value);
  }

  @action
  Future setTheme(bool value) async {
    isDarkTheme = value;
    await _saveSetting();
  }

  @action
  Future setWakeLock(bool value) async {
    isEnabledWakelock = value;
    await Wakelock.toggle(on: value);
    await _saveSetting();
  }

  Future _saveSetting() async {
    await myDatabase.saveSetting(toMap());
  }

  @computed
  ThemeData get getTheme {
    if (isDarkTheme) {
      return _darkTheme;
    }
    return _lightTheme;
  }

  final ThemeData _lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.white,
    canvasColor: Colors.white, //cor do fundo
    dialogBackgroundColor: Colors.white,
    errorColor: Colors.red[400],
    primaryColorLight: Colors.green[400],
    primaryColor: Colors.deepPurpleAccent,
    accentColor: Colors.deepPurpleAccent,
    hintColor: Colors.grey[400],
    textSelectionColor: Colors.black, //Cor do texto comum
    textSelectionHandleColor: Colors.white, //cor do texto em botões e outros
    iconTheme: IconThemeData(color: Colors.black),
    unselectedWidgetColor: Colors.black,
    cardTheme: CardTheme(
      color: Colors.grey[300],
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey[800]),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      enabledBorder: getBorder(Colors.deepPurpleAccent),
      focusedBorder: getBorder(Colors.deepPurpleAccent),
      errorBorder: getBorder(Colors.red),
      focusedErrorBorder: getBorder(Colors.red),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 30,
    ),
  );

  final ThemeData _darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.black54,
    canvasColor: Colors.black54, //cor do fundo
    dialogBackgroundColor: Colors.grey[900],
    errorColor: Colors.red[400],
    primaryColorLight: Colors.green[400],
    primaryColor: Colors.deepPurple,
    accentColor: Colors.deepPurple,
    hintColor: Colors.grey[900],
    focusColor: Colors.grey[800],
    textSelectionColor: Colors.white.withAlpha(200), // comum
    textSelectionHandleColor: Colors.white.withAlpha(200), // botões
    iconTheme: IconThemeData(color: Colors.white.withAlpha(200)),
    unselectedWidgetColor: Colors.white.withAlpha(200),

    cardTheme: CardTheme(
      color: Colors.grey[900].withAlpha(180),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey[400]),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      enabledBorder: getBorder(Colors.deepPurple),
      focusedBorder: getBorder(Colors.deepPurple),
      errorBorder: getBorder(Colors.red),
      focusedErrorBorder: getBorder(Colors.red),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 30,
    ),
  );

  static OutlineInputBorder getBorder(Color receivedColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: receivedColor),
    );
  }
}
