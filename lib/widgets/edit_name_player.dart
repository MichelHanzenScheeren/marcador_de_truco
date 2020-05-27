import 'package:flutter/material.dart';
import 'package:marcadordetruco/models/player.dart';
import '../validators/form_validators.dart';
import './custom_button.dart';
import './custom_text_field.dart';

class EditNamePlayer extends StatefulWidget {
  final String initialValue;
  final Function(String value) setName;
  final Players playerNumber;
  EditNamePlayer({
    this.initialValue,
    this.setName,
    this.playerNumber,
  });

  @override
  _EditNamePlayerState createState() => _EditNamePlayerState(initialValue);
}

class _EditNamePlayerState extends State<EditNamePlayer> {
  final fieldKey = GlobalKey<FormFieldState>();
  String name;
  _EditNamePlayerState(this.name);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(
              autoFocus: true,
              fieldKey: fieldKey,
              label: "Player ${widget.playerNumber.index + 1}",
              initialValue: name,
              changed: (String value) => name = value,
              validator: FormValidators.playerName,
              textCenter: false,
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomButton(
                    buttonText: "Cancelar",
                    backGroundColor: Colors.transparent,
                    borderColor: Colors.red,
                    textColor: Colors.black,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    buttonText: "Salvar",
                    backGroundColor: Theme.of(context).accentColor,
                    textColor: Theme.of(context).splashColor,
                    onPressed: editName,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void editName() {
    if (fieldKey.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      if (name != widget.initialValue) widget.setName(name);
      Navigator.pop(context);
    }
  }
}
