import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/widgets/game_rounds.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/widgets/game_score.dart';

class RoundsTab extends StatelessWidget {
  final Truco truco;
  RoundsTab(this.truco);
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Card(
        borderOnForeground: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: <Widget>[
              GameScore(truco),
              Divider(),
              GameRounds(truco, controller),
              verificateIfIsEmpty(),
            ],
          ),
        ),
      ),
    );
  }

  Widget verificateIfIsEmpty() {
    return Observer(
      builder: (context) {
        if (truco.rounds.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.history, size: 150),
              SizedBox(height: 15),
              Text(
                "Nenhuma rodada por enquanto...",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textSelectionColor,
                ),
              ),
              SizedBox(height: 15),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
