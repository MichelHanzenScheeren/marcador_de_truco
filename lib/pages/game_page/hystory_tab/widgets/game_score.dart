import 'package:flutter/material.dart';
import '../../../../models/truco.dart';

class GameScore extends StatelessWidget {
  final Truco truco;
  GameScore(this.truco);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(truco.player1.name, style: TextStyle(fontSize: 18)),
              Text(truco.player2.name, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                truco.player1.image,
                fit: BoxFit.fill,
                width: 70,
                height: 70,
              ),
            ),
            Text("${truco.player1.points}", style: TextStyle(fontSize: 40)),
            Text("X", style: TextStyle(fontSize: 40)),
            Text("${truco.player2.points}", style: TextStyle(fontSize: 40)),
            ClipOval(
              child: Image.asset(
                truco.player2.image,
                fit: BoxFit.fill,
                width: 70,
                height: 70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
