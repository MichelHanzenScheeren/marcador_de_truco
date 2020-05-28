import 'package:flutter/material.dart';
import '../../../../../validators/form_validators.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../models/player.dart';

class PlayersNames extends StatelessWidget {
  final Player player1;
  final Player player2;
  final double space;
  PlayersNames({
    @required this.player1,
    @required this.player2,
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: CustomTextField(
            myPadding: EdgeInsets.only(right: space / 2),
            initialValue: player1.name,
            label: "Player 1",
            changed: player1.setName,
            validator: FormValidators.playerName,
          ),
        ),
        Flexible(
          flex: 1,
          child: CustomTextField(
            myPadding: EdgeInsets.only(left: space / 2),
            initialValue: player2.name,
            label: "Player 2",
            changed: player2.setName,
            validator: FormValidators.playerName,
          ),
        ),
      ],
    );
  }
}
