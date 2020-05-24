import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import '../../../../models/round.dart';
import '../../../../models/truco.dart';

class GameRounds extends StatelessWidget {
  final Truco truco;
  final ScrollController controller;
  GameRounds(this.truco, this.controller);

  @override
  Widget build(BuildContext context) {
    if (truco.rounds.length == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Rodadas", style: TextStyle(fontSize: 25)),
          SizedBox(height: 5),
          Icon(Icons.update, size: 100),
          Text(
            "Nada por enquanto...",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Text("Rodadas", style: TextStyle(fontSize: 25)),
          SizedBox(height: 5),
          ListView.builder(
            controller: controller,
            shrinkWrap: true,
            itemCount: truco.rounds.length,
            itemBuilder: (context, index) {
              return roundLine(truco.rounds[index], index);
            },
          ),
          SizedBox(height: 10),
        ],
      );
    }
  }

  Widget roundLine(Round round, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 5),
      child: Row(
        mainAxisAlignment: round.playerNumber == Players.p1
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
            ),
            child: Text("${index + 1}ª"),
          ),
          SizedBox(width: 5),
          Text(
            "Marcou ${round.points} " +
                (round.points == 1 ? "ponto" : "pontos"),
            textAlign: TextAlign.left,
          ),
          SizedBox(width: 2),
          buildDate(round.dateTime),
        ],
      ),
    );
  }

  Widget buildDate(DateTime dateTime) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Text(
        "${dateTime.hour}:${dateTime.minute}",
        style: TextStyle(fontSize: 10, color: Colors.grey),
        textAlign: TextAlign.left,
      ),
    );
  }
}
