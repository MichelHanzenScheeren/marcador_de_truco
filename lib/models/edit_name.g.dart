// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_name.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditName on _EditNameBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_EditNameBase.isValid'))
      .value;

  final _$nameAtom = Atom(name: '_EditNameBase.name');

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

  final _$_EditNameBaseActionController =
      ActionController(name: '_EditNameBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditNameBaseActionController.startAction(
        name: '_EditNameBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditNameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
isValid: ${isValid}
    ''';
  }
}
