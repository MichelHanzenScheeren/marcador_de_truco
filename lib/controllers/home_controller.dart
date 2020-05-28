import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  bool isLoading = false;

  String maxPoints = "12";

  @action
  void setPage(int number) => currentPage = number;

  @action
  void setLoading(bool condition) => isLoading = condition;

  void setMaxPoints(String value) => maxPoints = value;
}
