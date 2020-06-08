import 'package:flutter/material.dart';

class VictorysRow extends StatelessWidget {
  final int p1Wins;
  final int p2Wins;
  final double space;

  VictorysRow({
    this.p1Wins: 0,
    this.p2Wins: 0,
    this.space: 0,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).textSelectionColor,
      fontSize: 18,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: space / 3),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("$p1Wins", style: textStyle),
          Text("Vitórias", style: textStyle),
          Text("$p2Wins", style: textStyle),
        ],
      ),
    );
  }
}
