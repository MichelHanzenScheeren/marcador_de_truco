import 'package:mobx/mobx.dart';
part 'edit_name.g.dart';

class EditName = _EditNameBase with _$EditName;

abstract class _EditNameBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get isValid => name.isNotEmpty;
}
