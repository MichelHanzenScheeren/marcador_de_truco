import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'my_theme.g.dart';

enum theme { light, dark }

class MyTheme = _MyThemeBase with _$MyTheme;

abstract class _MyThemeBase with Store {
  @observable
  theme currentTheme = theme.light;

  @action
  void setTheme() {
    if (currentTheme == theme.light) {
      currentTheme = theme.dark;
    } else {
      currentTheme = theme.light;
    }
  }

  @computed
  ThemeData get getTheme {
    if (currentTheme == theme.light) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.deepPurpleAccent,
    accentColor: Colors.deepPurpleAccent,
    splashColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.deepOrangeAccent,
    accentColor: Colors.deepOrangeAccent,
    splashColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
