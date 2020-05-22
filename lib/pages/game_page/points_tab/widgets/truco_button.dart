import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../models/truco.dart';
import '../../../../statics/project_images.dart';

class TrucoButton extends StatelessWidget {
  final Truco truco;
  TrucoButton({@required this.truco});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
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
                  style: TextStyle(fontSize: 25, color: Colors.white),
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
      height: 40,
      width: 40,
    );
  }
}
