import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'my_theme.g.dart';

enum theme { light, dark }

class MyTheme = _MyThemeBase with _$MyTheme;

abstract class _MyThemeBase with Store {
  @observable
  bool isDarkTheme = false;

  @action
  void setTheme(bool value) => isDarkTheme = value;

  @computed
  ThemeData get getTheme {
    if (isDarkTheme) {
      return darkTheme;
    }
    return lightTheme;
  }

  final ThemeData lightTheme = ThemeData(
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

  final ThemeData darkTheme = ThemeData(
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

  void configureOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
