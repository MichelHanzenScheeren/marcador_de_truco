import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/rounds_tab/widgets/game_rounds.dart';
import 'package:marcadordetruco/pages/game_page/rounds_tab/widgets/game_score.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        color: Colors.grey[300],
        elevation: 0,
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
              SizedBox(height: 20),
              Text(
                "Nenhuma rodada por enquanto...",
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
