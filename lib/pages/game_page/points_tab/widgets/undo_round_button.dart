import 'package:flutter/material.dart';

class UndoRoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Desfazer rodada"),
              SizedBox(width: 5),
              Icon(Icons.settings_backup_restore),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
