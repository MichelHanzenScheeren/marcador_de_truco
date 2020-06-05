import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/pages/game_page/widgets/rounds_tab/widgets/game_score.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';
import 'announce_winner.dart';

import 'final_placar.dart';

class VictoryPage extends StatelessWidget {
  final GameController gameController;
  VictoryPage({@required this.gameController});

  @override
  Widget build(BuildContext context) {
    gameController.save();
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: theme.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FinalPlacar(gameController.currentGame),
              AnnounceWinner(gameController.currentGame.getWinner),
              Observer(
                builder: (context) {
                  if (gameController.isSaving) {
                    return Column(
                      children: <Widget>[
                        WaitingIndicator(
                          size: 50,
                          valueColor: theme.textSelectionColor,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Salvando partida...",
                          style: TextStyle(color: theme.textSelectionColor),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        CustomButton(
                          buttonText: "Quero uma revanche!",
                          textColor: theme.textSelectionColor,
                          borderColor: theme.dialogBackgroundColor,
                          backGroundColor: theme.dialogBackgroundColor,
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          buttonText: "Voltar ao menu",
                          textColor: theme.textSelectionColor,
                          backGroundColor: theme.primaryColor,
                          borderColor: theme.textSelectionColor,
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
