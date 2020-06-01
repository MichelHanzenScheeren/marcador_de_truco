// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyTheme on _MyThemeBase, Store {
  Computed<ThemeData> _$getThemeComputed;

  @override
  ThemeData get getTheme =>
      (_$getThemeComputed ??= Computed<ThemeData>(() => super.getTheme,
              name: '_MyThemeBase.getTheme'))
          .value;

  final _$isDarkThemeAtom = Atom(name: '_MyThemeBase.isDarkTheme');

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  final _$_MyThemeBaseActionController = ActionController(name: '_MyThemeBase');

  @override
  void setTheme(bool value) {
    final _$actionInfo = _$_MyThemeBaseActionController.startAction(
        name: '_MyThemeBase.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_MyThemeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme},
getTheme: ${getTheme}
    ''';
  }
}
