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

  final _$currentThemeAtom = Atom(name: '_MyThemeBase.currentTheme');

  @override
  theme get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(theme value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  final _$_MyThemeBaseActionController = ActionController(name: '_MyThemeBase');

  @override
  void setTheme() {
    final _$actionInfo = _$_MyThemeBaseActionController.startAction(
        name: '_MyThemeBase.setTheme');
    try {
      return super.setTheme();
    } finally {
      _$_MyThemeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
getTheme: ${getTheme}
    ''';
  }
}
