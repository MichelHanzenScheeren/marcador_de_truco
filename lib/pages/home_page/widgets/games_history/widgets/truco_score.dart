import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/widgets/image_container.dart';

class TrucoScore extends StatelessWidget {
  final Truco truco;
  TrucoScore(this.truco);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textSelectionColor;
    TextStyle style = TextStyle(color: color, fontSize: 40);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Text(
                    truco.player1.description.name,
                    style: style.copyWith(fontSize: 18),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    truco.player2.description.name,
                    style: style.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ImageContainer(
                image: truco.player1.description.image,
                type: truco.player1.description.imageType,
                width: 70,
                height: 70,
              ),
              Text("${truco.player1.points}", style: style),
              Text("X", style: style),
              Text("${truco.player2.points}", style: style),
              ImageContainer(
                image: truco.player2.description.image,
                type: truco.player2.description.imageType,
                width: 70,
                height: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
