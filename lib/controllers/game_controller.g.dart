// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameController on _GameControllerBase, Store {
  Computed<int> _$getTotalMatchesComputed;

  @override
  int get getTotalMatches =>
      (_$getTotalMatchesComputed ??= Computed<int>(() => super.getTotalMatches,
              name: '_GameControllerBase.getTotalMatches'))
          .value;

  final _$currentGameAtom = Atom(name: '_GameControllerBase.currentGame');

  @override
  Truco get currentGame {
    _$currentGameAtom.reportRead();
    return super.currentGame;
  }

  @override
  set currentGame(Truco value) {
    _$currentGameAtom.reportWrite(value, super.currentGame, () {
      super.currentGame = value;
    });
  }

  final _$player1WinsAtom = Atom(name: '_GameControllerBase.player1Wins');

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

  final _$player2WinsAtom = Atom(name: '_GameControllerBase.player2Wins');

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

  final _$isSavingAtom = Atom(name: '_GameControllerBase.isSaving');

  @override
  bool get isSaving {
    _$isSavingAtom.reportRead();
    return super.isSaving;
  }

  @override
  set isSaving(bool value) {
    _$isSavingAtom.reportWrite(value, super.isSaving, () {
      super.isSaving = value;
    });
  }

  final _$_GameControllerBaseActionController =
      ActionController(name: '_GameControllerBase');

  @override
  dynamic incrementWins() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.incrementWins');
    try {
      return super.incrementWins();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void newGame() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.newGame');
    try {
      return super.newGame();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsSaving(bool condition) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.setIsSaving');
    try {
      return super.setIsSaving(condition);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentGame: $currentGame,
player1Wins: $player1Wins,
player2Wins: $player2Wins,
isSaving: $isSaving,
getTotalMatches: $getTotalMatches
    ''';
  }
}
