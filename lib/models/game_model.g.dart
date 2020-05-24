// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameModel on _GameModelBase, Store {
  final _$player1WinsAtom = Atom(name: '_GameModelBase.player1Wins');

  @override
  int get player1Wins {
    _$player1WinsAtom.reportRead();
    return super.player1Wins;
  }

  @override
  set player1Wins(int value) {
    _$player1WinsAtom.reportWrite(value, super.player1Wins, () {
      super.player1Wins = value;
    });
  }

  final _$player2WinsAtom = Atom(name: '_GameModelBase.player2Wins');

  @override
  int get player2Wins {
    _$player2WinsAtom.reportRead();
    return super.player2Wins;
  }

  @override
  set player2Wins(int value) {
    _$player2WinsAtom.reportWrite(value, super.player2Wins, () {
      super.player2Wins = value;
    });
  }

  final _$_GameModelBaseActionController =
      ActionController(name: '_GameModelBase');

  @override
  dynamic incrementWins(Players playerNumber) {
    final _$actionInfo = _$_GameModelBaseActionController.startAction(
        name: '_GameModelBase.incrementWins');
    try {
      return super.incrementWins(playerNumber);
    } finally {
      _$_GameModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGame(Truco truco) {
    final _$actionInfo = _$_GameModelBaseActionController.startAction(
        name: '_GameModelBase.addGame');
    try {
      return super.addGame(truco);
    } finally {
      _$_GameModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
player1Wins: ${player1Wins},
player2Wins: ${player2Wins}
    ''';
  }
}
