import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/truco.dart';
import 'package:marcadordetruco/statics/my_images.dart';

class TrucoButton extends StatelessWidget {
  final Truco truco;
  final double heigth;
  TrucoButton({@required this.truco, this.heigth: 700});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      width: 190,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            cardImage(),
            Padding(
              padding: EdgeInsets.all(5),
              child: Observer(builder: (_) {
                return Text(
                  truco.getTrucoText,
                  style: TextStyle(
                    fontSize: heigth * 0.032,
                    color: theme.textSelectionHandleColor.withAlpha(240),
                  ),
                );
              }),
            ),
            cardImage(),
          ],
        ),
        onTap: truco.setCurrentValue,
        onLongPress: truco.restartCurrentValue,
      ),
    );
  }

  Widget cardImage() {
    return Image.asset(
      MyImages.truco,
      fit: BoxFit.fill,
      height: heigth * 0.045,
      width: 35,
    );
  }
}
