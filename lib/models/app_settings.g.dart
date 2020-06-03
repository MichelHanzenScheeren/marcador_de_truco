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

  final _$isLoadingAtom = Atom(name: '_AppSettingsBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
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
  void setTheme(bool value) {
    final _$actionInfo = _$_AppSettingsBaseActionController.startAction(
        name: '_AppSettingsBase.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_AppSettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWakeLock(bool value) {
    final _$actionInfo = _$_AppSettingsBaseActionController.startAction(
        name: '_AppSettingsBase.setWakeLock');
    try {
      return super.setWakeLock(value);
    } finally {
      _$_AppSettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_AppSettingsBaseActionController.startAction(
        name: '_AppSettingsBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_AppSettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme},
isEnabledWakelock: ${isEnabledWakelock},
isLoading: ${isLoading},
getTheme: ${getTheme}
    ''';
  }
}
