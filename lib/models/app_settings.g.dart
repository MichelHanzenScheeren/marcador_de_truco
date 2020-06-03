// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppSettings on _AppSettingsBase, Store {
  Computed<ThemeData> _$getThemeComputed;

  @override
  ThemeData get getTheme =>
      (_$getThemeComputed ??= Computed<ThemeData>(() => super.getTheme,
              name: '_AppSettingsBase.getTheme'))
          .value;

  final _$isDarkThemeAtom = Atom(name: '_AppSettingsBase.isDarkTheme');

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

  final _$isEnabledWakelockAtom =
      Atom(name: '_AppSettingsBase.isEnabledWakelock');

  @override
  bool get isEnabledWakelock {
    _$isEnabledWakelockAtom.reportRead();
    return super.isEnabledWakelock;
  }

  @override
  set isEnabledWakelock(bool value) {
    _$isEnabledWakelockAtom.reportWrite(value, super.isEnabledWakelock, () {
      super.isEnabledWakelock = value;
    });
  }

  final _$setThemeAsyncAction = AsyncAction('_AppSettingsBase.setTheme');

  @override
  Future<dynamic> setTheme(bool value) {
    return _$setThemeAsyncAction.run(() => super.setTheme(value));
  }

  final _$setWakeLockAsyncAction = AsyncAction('_AppSettingsBase.setWakeLock');

  @override
  Future<dynamic> setWakeLock(bool value) {
    return _$setWakeLockAsyncAction.run(() => super.setWakeLock(value));
  }

  final _$_AppSettingsBaseActionController =
      ActionController(name: '_AppSettingsBase');

  @override
  void _setTheme(bool value) {
    final _$actionInfo = _$_AppSettingsBaseActionController.startAction(
        name: '_AppSettingsBase._setTheme');
    try {
      return super._setTheme(value);
    } finally {
      _$_AppSettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setWakeLock(bool value) {
    final _$actionInfo = _$_AppSettingsBaseActionController.startAction(
        name: '_AppSettingsBase._setWakeLock');
    try {
      return super._setWakeLock(value);
    } finally {
      _$_AppSettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme},
isEnabledWakelock: ${isEnabledWakelock},
getTheme: ${getTheme}
    ''';
  }
}
