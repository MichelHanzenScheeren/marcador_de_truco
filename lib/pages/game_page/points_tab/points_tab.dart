import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/truco_button.dart';
import './widgets/player_widget.dart';
import './widgets/undo_round_button.dart';
import '../../../models/truco.dart';
import '../../../statics/my_images.dart';

class PointsTab extends StatelessWidget {
  final Truco truco;
  final int p1Wins;
  final int p2Wins;
  PointsTab(this.truco, this.p1Wins, this.p2Wins);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double appBarHeight = Scaffold.of(context).appBarMaxHeight;
    final double height = size.height - appBarHeight;
    final double width = size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              PlayerWidget(
                player: truco.player1,
                incrementImage: MyImages.incrementLeft,
                truco: truco,
                size: Size(width, height),
              ),
              PlayerWidget(
                player: truco.player2,
                incrementImage: MyImages.incrementRight,
                truco: truco,
                size: Size(width, height),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            width: width,
            height: height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TrucoButton(truco: truco),
                UndoRoundButton(undoFunction: truco.undoRound),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("$p1Wins", style: TextStyle(fontSize: 20)),
                      Text("Vitórias", style: TextStyle(fontSize: 20)),
                      Text("$p2Wins", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
