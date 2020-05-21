import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import '../../../../models/round.dart';
import '../../../../models/truco.dart';

class GameRounds extends StatelessWidget {
  final Truco truco;
  GameRounds(this.truco);

  @override
  Widget build(BuildContext context) {
    if (truco.rounds.length == 0) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.update, size: 100),
            SizedBox(height: 20),
            Text(
              "Nada por enquanto...",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: truco.rounds.length,
          itemBuilder: (context, index) {
            return roundLine(truco.rounds[index], index);
          },
        ),
      );
    }
  }

  Widget roundLine(Round round, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
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
