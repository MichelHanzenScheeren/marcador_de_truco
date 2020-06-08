import 'package:flutter/material.dart';

class PlayersNamesRow extends StatelessWidget {
  final String p1Name;
  final String p2Name;
  final double textSize;

  PlayersNamesRow({
    @required this.p1Name,
    @required this.p2Name,
    this.textSize: 25,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).textSelectionColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          playerName(p1Name, textColor),
          playerName(p2Name, textColor),
        ],
      ),
    );
  }

  Widget playerName(String name, Color textColor) {
    return Expanded(
      flex: 1,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
        ),
      ),
    );
  }
}
