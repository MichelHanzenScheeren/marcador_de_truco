import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/build_rounds.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/exclude_option.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/time_details.dart';
import 'package:marcadordetruco/widgets/custom_snackbar.dart';
import 'package:marcadordetruco/widgets/game_score.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class GameHistory extends StatefulWidget {
  final HomeController homeController;
  GameHistory(this.homeController);

  @override
  _GameHistoryState createState() => _GameHistoryState(homeController);
}

class _GameHistoryState extends State<GameHistory> {
  final scrollController = ScrollController();
  final HomeController homeController;
  _GameHistoryState(this.homeController);

  @override
  void initState() {
    super.initState();
    homeController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Observer(builder: (_) {
        if (homeController.isLoading) {
          return waiting();
        } else if (homeController.games.length == 0) {
          return emptyWidget();
        }
        return ListView.builder(
          controller: scrollController,
          itemCount: homeController.games.length,
          itemBuilder: (context, index) {
            return trucoCard(context, homeController.games[index], index);
          },
        );
      }),
    );
  }

  Widget waiting() {
    return Container(
      alignment: Alignment.center,
      child: WaitingIndicator(
        valueColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget emptyWidget() {
    return Container(
      margin: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.history, size: 180),
          SizedBox(height: 10),
          Text(
            "Seu histórico de partidas será mostrado aqui...",
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).textSelectionColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget trucoCard(BuildContext context, Truco truco, int index) {
    return InkWell(
      child: Card(
        borderOnForeground: false,
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            accentColor: Theme.of(context).textSelectionColor,
          ),
          child: ExpansionTile(
            title: GameScore(truco),
            children: <Widget>[
              TimeDetails(truco.startDate, truco.finalDate),
              BuildRounds(
                homeController.getRounds,
                truco.trucoID,
                scrollController,
              ),
            ],
          ),
        ),
      ),
      onLongPress: () => excludeItem(truco.trucoID),
    );
  }

  void excludeItem(int trucoID) {
    showModalBottomSheet(
      context: context,
      elevation: 30,
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      enableDrag: false,
      builder: (context) {
        return ExcludeOption(
          homeController,
          trucoID,
          onSucess: onSucess,
          onFail: onFail,
        );
      },
    );
  }

  void onSucess() {
    final ThemeData theme = Theme.of(context);
    Scaffold.of(context).showSnackBar(CustomSnackbar(
      text: "Registro deletado com sucesso!",
      textColor: theme.textSelectionHandleColor,
      backgroundColor: theme.primaryColorLight,
      secondsDuration: 2,
    ));
  }

  void onFail(Exception erro) {
    final ThemeData theme = Theme.of(context);
    Scaffold.of(context).showSnackBar(CustomSnackbar(
      text: "Não foi possível deleterar este registro!",
      textColor: theme.textSelectionHandleColor,
      backgroundColor: theme.errorColor,
      secondsDuration: 3,
    ));
  }
}
