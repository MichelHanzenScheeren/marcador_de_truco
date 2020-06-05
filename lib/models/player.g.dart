// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Player on _PlayerBase, Store {
  final _$pointsAtom = Atom(name: '_PlayerBase.points');

  @override
  int get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(int value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  final _$_PlayerBaseActionController = ActionController(name: '_PlayerBase');

  @override
  void setPoints(int value) {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.setPoints');
    try {
      return super.setPoints(value);
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPoints() {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.resetPoints');
    try {
      return super.resetPoints();
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
points: $points
    ''';
  }
}
