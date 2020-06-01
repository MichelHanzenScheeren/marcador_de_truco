import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/statics/my_images.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class VictoryPage extends StatelessWidget {
  final GameController gameController;
  VictoryPage({@required this.gameController});

  @override
  Widget build(BuildContext context) {
    final Player winner = gameController.currentGame.getWinner;
    final theme = Theme.of(context);
    gameController.save();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Container(
                color: Theme.of(context).accentColor,
                child: Image.asset(MyImages.victory),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Vencedor:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: theme.textSelectionColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "${winner.description.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: theme.textSelectionColor,
              ),
            ),
            SizedBox(height: 20),
            Observer(
              builder: (context) {
                if (gameController.isSaving) {
                  return Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      WaitingIndicator(
                        size: 80,
                        valueColor: theme.primaryColor,
                      ),
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
                        textColor: theme.textSelectionHandleColor,
                        borderColor: theme.primaryColor,
                        backGroundColor: theme.primaryColor,
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        buttonText: "Voltar ao menu",
                        textColor: theme.textSelectionColor,
                        backGroundColor: theme.backgroundColor,
                        borderColor: theme.primaryColor,
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
    );
  }
}
