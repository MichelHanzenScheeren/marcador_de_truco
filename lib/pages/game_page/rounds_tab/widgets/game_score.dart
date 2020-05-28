import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/widgets/image_container.dart';

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
            Observer(builder: (_) {
              return ImageContainer(
                image: truco.player1.image,
                type: truco.player1.imageType,
                width: 70,
                height: 70,
              );
            }),
            Text("${truco.player1.points}", style: TextStyle(fontSize: 40)),
            Text("X", style: TextStyle(fontSize: 40)),
            Text("${truco.player2.points}", style: TextStyle(fontSize: 40)),
            Observer(builder: (_) {
              return ImageContainer(
                image: truco.player2.image,
                type: truco.player2.imageType,
                width: 70,
                height: 70,
              );
            }),
          ],
        ),
      ],
    );
  }
}
