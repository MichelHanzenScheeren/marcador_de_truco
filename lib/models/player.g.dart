// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Player on _PlayerBase, Store {
  final _$imageAtom = Atom(name: '_PlayerBase.image');

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$nameAtom = Atom(name: '_PlayerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

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
  void setName(String text) {
    final _$actionInfo =
        _$_PlayerBaseActionController.startAction(name: '_PlayerBase.setName');
    try {
      return super.setName(text);
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(String text) {
    final _$actionInfo =
        _$_PlayerBaseActionController.startAction(name: '_PlayerBase.setImage');
    try {
      return super.setImage(text);
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementPoints() {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.incrementPoints');
    try {
      return super.incrementPoints();
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementPoints() {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.decrementPoints');
    try {
      return super.decrementPoints();
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
image: ${image},
name: ${name},
points: ${points}
    ''';
  }
}