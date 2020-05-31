import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'my_theme.g.dart';

enum theme { light, dark }

class MyTheme = _MyThemeBase with _$MyTheme;

abstract class _MyThemeBase with Store {
  @observable
  theme currentTheme = theme.light;

  @action
  void setTheme() {
    if (currentTheme == theme.light)
      currentTheme = theme.dark;
    else
      currentTheme = theme.light;
  }

  @computed
  ThemeData get getTheme {
    if (currentTheme == theme.light)
      return lightTheme;
    else
      return darkTheme;
  }

  final ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.deepPurpleAccent,
    accentColor: Colors.deepPurpleAccent,
    splashColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      enabledBorder: getBorder(Colors.deepPurpleAccent),
      focusedBorder: getBorder(Colors.deepPurpleAccent),
      errorBorder: getBorder(Colors.red),
      focusedErrorBorder: getBorder(Colors.red),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    backgroundColor: Colors.black87,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.deepPurple,
    accentColor: Colors.deepPurple,
    splashColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      enabledBorder: getBorder(Colors.deepPurple),
      focusedBorder: getBorder(Colors.deepPurple),
      errorBorder: getBorder(Colors.red),
      focusedErrorBorder: getBorder(Colors.red),
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
