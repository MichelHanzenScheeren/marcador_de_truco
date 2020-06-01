import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/models/round.dart';
import 'package:marcadordetruco/widgets/title_divider.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class BuildRounds extends StatelessWidget {
  final Function(int trucoID) getRounds;
  final int trucoID;
  final ScrollController scrollController;
  BuildRounds(this.getRounds, this.trucoID, this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TitleDivider(
            text: "Rodadas",
            dividerColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textSelectionColor,
          ),
          SizedBox(height: 10),
          FutureBuilder<List<Round>>(
            future: getRounds(trucoID),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  alignment: Alignment.center,
                  child: WaitingIndicator(
                    valueColor: Theme.of(context).primaryColor,
                  ),
                );
              } else {
                return ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Round round = snapshot.data[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: roundLine(round, index, context),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget roundLine(Round round, int index, BuildContext context) {
    return Row(
      mainAxisAlignment: round.playerNumber == Players.p1
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            shape: BoxShape.circle,
          ),
          child: Text(
            "${index + 1}ª",
          ),
        ),
        SizedBox(width: 5),
        Text(
          "Marcou ${round.points} " + (round.points == 1 ? "ponto" : "pontos"),
          textAlign: TextAlign.left,
          style: TextStyle(color: Theme.of(context).textSelectionColor),
        ),
      ],
    );
  }
}
