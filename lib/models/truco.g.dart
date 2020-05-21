// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truco.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Truco on _TrucoBase, Store {
  Computed<String> _$getTrucoTextComputed;

  @override
  String get getTrucoText =>
      (_$getTrucoTextComputed ??= Computed<String>(() => super.getTrucoText,
              name: '_TrucoBase.getTrucoText'))
          .value;

  final _$currentValueAtom = Atom(name: '_TrucoBase.currentValue');

  @override
  int get currentValue {
    _$currentValueAtom.reportRead();
    return super.currentValue;
  }

  @override
  set currentValue(int value) {
    _$currentValueAtom.reportWrite(value, super.currentValue, () {
      super.currentValue = value;
    });
  }

  final _$_TrucoBaseActionController = ActionController(name: '_TrucoBase');

  @override
  void setCurrentValue() {
    final _$actionInfo = _$_TrucoBaseActionController.startAction(
        name: '_TrucoBase.setCurrentValue');
    try {
      return super.setCurrentValue();
    } finally {
      _$_TrucoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic restartCurrentValue() {
    final _$actionInfo = _$_TrucoBaseActionController.startAction(
        name: '_TrucoBase.restartCurrentValue');
    try {
      return super.restartCurrentValue();
    } finally {
      _$_TrucoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveRound(Players playerNumber) {
    final _$actionInfo =
        _$_TrucoBaseActionController.startAction(name: '_TrucoBase.saveRound');
    try {
      return super.saveRound(playerNumber);
    } finally {
      _$_TrucoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentValue: ${currentValue},
getTrucoText: ${getTrucoText}
    ''';
  }
}
