import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/widgets/players_images_row.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/widgets/players_names_row.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/widgets/players_points_row.dart';
import 'package:marcadordetruco/pages/game_page/widgets/points_tab/widgets/victorys_row.dart';
import './widgets/truco_button.dart';
import './widgets/undo_round_button.dart';

class PointsTab extends StatelessWidget {
  final Truco truco;
  final int p1Wins;
  final int p2Wins;
  PointsTab(this.truco, this.p1Wins, this.p2Wins);

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double space = heigth * 0.023;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PlayersImagesRow(
                p1Description: truco.player1.description,
                p2Description: truco.player2.description,
                space: space,
                imageSize: heigth * 0.16,
              ),
              PlayersNamesRow(
                p1Name: truco.player1.description.name,
                p2Name: truco.player2.description.name,
                textSize: heigth * 0.032,
              ),
              PlayersPointsRow(
                truco: truco,
                space: space,
                screenHeigth: heigth,
              ),
            ],
          ),
        ),
        SizedBox(height: space * 1.8),
        TrucoButton(truco: truco, heigth: heigth),
        SizedBox(height: space * 1.4),
        UndoRoundButton(undoFunction: truco.undoRound),
        SizedBox(height: space * 1.4),
        VictorysRow(
          p1Wins: p1Wins,
          p2Wins: p2Wins,
          space: space,
        ),
      ],
    );
  }
}
