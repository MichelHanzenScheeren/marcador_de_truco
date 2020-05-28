import 'package:flutter/material.dart';
import 'package:marcadordetruco/pages/home_page/widgets/init_game/init_game.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentPage = 0;

  final tabs = [InitGame(), Container(color: Colors.yellow)];

  @action
  void setPage(int number) => currentPage = number;

  @computed
  Widget get getTab => tabs[currentPage];
}
