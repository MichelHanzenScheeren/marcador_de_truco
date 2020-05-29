// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_description.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerDescription on _PlayerDescriptionBase, Store {
  final _$imageAtom = Atom(name: '_PlayerDescriptionBase.image');

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

  final _$imageTypeAtom = Atom(name: '_PlayerDescriptionBase.imageType');

  @override
  ImageType get imageType {
    _$imageTypeAtom.reportRead();
    return super.imageType;
  }

  @override
  set imageType(ImageType value) {
    _$imageTypeAtom.reportWrite(value, super.imageType, () {
      super.imageType = value;
    });
  }

  final _$nameAtom = Atom(name: '_PlayerDescriptionBase.name');

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

  final _$_PlayerDescriptionBaseActionController =
      ActionController(name: '_PlayerDescriptionBase');

  @override
  void setName(String text) {
    final _$actionInfo = _$_PlayerDescriptionBaseActionController.startAction(
        name: '_PlayerDescriptionBase.setName');
    try {
      return super.setName(text);
    } finally {
      _$_PlayerDescriptionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(String text, ImageType type) {
    final _$actionInfo = _$_PlayerDescriptionBaseActionController.startAction(
        name: '_PlayerDescriptionBase.setImage');
    try {
      return super.setImage(text, type);
    } finally {
      _$_PlayerDescriptionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
imageType: ${imageType},
name: ${name}
    ''';
  }
}
