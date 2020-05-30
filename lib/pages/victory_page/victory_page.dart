import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/controllers/game_controller.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/pages/victory_page/myButton.dart';
import 'package:marcadordetruco/statics/my_images.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class VictoryPage extends StatelessWidget {
  final GameController gameController;
  VictoryPage({@required this.gameController});

  @override
  Widget build(BuildContext context) {
    final Player winner = gameController.currentGame.getWinner;
    final Size size = MediaQuery.of(context).size;
    final Color primaryColor = Theme.of(context).accentColor;
    final Color backColor = Theme.of(context).scaffoldBackgroundColor;
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
                        backGroundColor: backColor,
                        valueColor: primaryColor,
                      ),
                      Text("Salvando partida..."),
                    ],
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      MyButton(
                        text: "Quero uma revanche!",
                        size: size,
                        borderColor: primaryColor,
                        backColor: primaryColor,
                        function: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      SizedBox(height: 10),
                      MyButton(
                        text: "Voltar ao menu",
                        size: size,
                        backColor: backColor,
                        borderColor: primaryColor,
                        function: () {
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
