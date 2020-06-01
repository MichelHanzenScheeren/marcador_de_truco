import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:marcadordetruco/models/truco.dart';

class GameRounds extends StatelessWidget {
  final Truco truco;
  final ScrollController controller;
  GameRounds(this.truco, this.controller);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5),
        Text("Rodadas",
            style: TextStyle(
              fontSize: 25,
              color: theme.textSelectionColor,
            )),
        SizedBox(height: 10),
        ListView.builder(
          controller: controller,
          shrinkWrap: true,
          itemCount: truco.rounds.length,
          itemBuilder: (context, index) {
            Round round = truco.rounds[index];
            return Padding(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: round.playerNumber == Players.p1
                        ? roundLine(round, index, theme)
                        : Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: round.playerNumber == Players.p2
                        ? roundLine(round, index, theme)
                        : Container(),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget roundLine(Round round, int index, ThemeData theme) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            shape: BoxShape.circle,
          ),
          child: Text("${index + 1}ª"),
        ),
        SizedBox(width: 5),
        Text(
          "Marcou ${round.points} " + (round.points == 1 ? "ponto" : "pontos"),
          textAlign: TextAlign.left,
          style: TextStyle(color: theme.textSelectionColor),
        ),
        SizedBox(width: 2),
        buildDate(round.dateTime),
      ],
    );
  }

  Widget buildDate(DateTime dateTime) {
    var hourFormat = DateFormat("HH:mm");
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Text(
        "${hourFormat.format(dateTime)}",
        style: TextStyle(fontSize: 10, color: Colors.grey),
        textAlign: TextAlign.left,
      ),
    );
  }
}
