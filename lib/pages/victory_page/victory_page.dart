import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/victory_page/myButton.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class VictoryPage extends StatelessWidget {
  final Truco truco;
  VictoryPage({@required this.truco});

  @override
  Widget build(BuildContext context) {
    final Player winner = truco.getWinner;
    final Size size = MediaQuery.of(context).size;
    final Color primaryColor = Theme.of(context).accentColor;
    final Color backColor = Theme.of(context).scaffoldBackgroundColor;
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
        ),
      ),
    );
  }
}
