import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './player.dart';
import './truco_button.dart';
import './undo_round_button.dart';

class PointsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Player(
              playerName: "Nós",
              playerImage: "images/player1.png",
              points: "0",
              incrementImage: "images/increment_left.png",
            ),
            Player(
              playerName: "Eles",
              playerImage: "images/player2.png",
              points: "0",
              incrementImage: "images/increment_right.png",
            ),
          ],
        ),
        TrucoButton(),
        UndoRoundButton(),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("0", style: TextStyle(fontSize: 20)),
              Text("Vitórias", style: TextStyle(fontSize: 20)),
              Text("0", style: TextStyle(fontSize: 20)),
            ],
          ),
        )
      ],
    );
  }
}
