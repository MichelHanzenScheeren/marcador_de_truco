import 'package:flutter/material.dart';
import 'package:marcadordetruco/database/database_connection.dart';
import 'package:marcadordetruco/database/my_database.dart';
import 'package:marcadordetruco/models/settings.dart';
import 'package:mobx/mobx.dart';

part 'my_theme.g.dart';

class MyTheme = _MyThemeBase with _$MyTheme;

abstract class _MyThemeBase with Store {
  MyDatabase myDatabase;
  Settings settings;

  @observable
  bool isDarkTheme = true;

  _MyThemeBase(DatabaseConnection connection) {
    myDatabase = MyDatabase(connection);
    validateCurrentTheme();
  }

  Future validateCurrentTheme() async {
    settings = await myDatabase.getSettings();
    if (settings.isDarkTheme != isDarkTheme) {
      _setTheme(settings.isDarkTheme);
    }
  }

  @action
  void _setTheme(bool value) => isDarkTheme = value;

  @action
  void setTheme(bool value) {
    isDarkTheme = value;
    _saveNewTheme(value);
  }

  void _saveNewTheme(bool value) async {
    settings.isDarkTheme = value;
    await myDatabase.saveNewTheme(settings);
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
