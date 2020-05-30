import 'package:flutter/material.dart';
import 'package:marcadordetruco/controllers/home_controller.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/widgets/waiting_indicator.dart';

class GameHistory extends StatelessWidget {
  final HomeController homeController;
  GameHistory(this.homeController);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Truco>>(
      future: homeController.getData(),
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
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${snapshot.data[index].id}"),
                subtitle: Text("${snapshot.data[index].maxPoints}"),
              );
            },
          );
        }
      },
    );
  }
}
