import 'package:flutter/material.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/build_rounds.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/time_details.dart';
import 'package:marcadordetruco/pages/home_page/widgets/games_history/widgets/truco_score.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class GameHistory extends StatelessWidget {
  final HomeController homeController;
  GameHistory(this.homeController);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Truco>>(
      future: homeController.getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return waiting(context);
        else if (snapshot.data.length == 0) return Text("VAZIO");

        return ListView.builder(
          controller: scrollController,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return trucoCard(context, snapshot.data[index]);
          },
        );
      },
    );
  }

  Widget waiting(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: WaitingIndicator(
        valueColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget trucoCard(BuildContext context, Truco truco) {
    return Card(
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: Colors.grey[300],
      elevation: 0,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          accentColor: Colors.black,
        ),
        child: ExpansionTile(
          title: TrucoScore(truco),
          children: <Widget>[
            TimeDetails(truco.startDate, truco.finalDate),
            BuildRounds(
              homeController.getRounds,
              truco.trucoID,
              scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
