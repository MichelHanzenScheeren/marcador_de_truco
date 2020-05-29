import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/player_description.dart';
import '../../../../../validators/form_validators.dart';
import '../../../../../widgets/custom_text_field.dart';

class PlayersNames extends StatelessWidget {
  final PlayerDescription p1Description;
  final PlayerDescription p2Description;
  final double space;
  PlayersNames({
    @required this.p1Description,
    @required this.p2Description,
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
          child: Observer(builder: (_) {
            return CustomTextField(
              myPadding: EdgeInsets.only(right: space / 2),
              initialValue: p1Description.name,
              label: "Player 1",
              changed: p1Description.setName,
              validator: FormValidators.playerName,
            );
          }),
        ),
        Flexible(
          flex: 1,
          child: Observer(builder: (_) {
            return CustomTextField(
              myPadding: EdgeInsets.only(left: space / 2),
              initialValue: p2Description.name,
              label: "Player 2",
              changed: p2Description.setName,
              validator: FormValidators.playerName,
            );
          }),
        ),
      ],
    );
  }
}
