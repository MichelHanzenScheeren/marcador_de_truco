import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class AnnounceWinner extends StatelessWidget {
  final Player winner;
  AnnounceWinner(this.winner);

  @override
  Widget build(BuildContext context) {
    final double myWidth = MediaQuery.of(context).size.width;
    final ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Text(
          "Vencedor:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: theme.textSelectionColor,
          ),
        ),
        SizedBox(height: 3),
        Text(
          "${winner.description.name}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: theme.textSelectionColor,
          ),
        ),
        Container(
          width: myWidth * 0.6,
          height: myWidth * 0.6,
          child: Image.asset(
            MyImages.victory,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
