import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/widgets/custom_button.dart';
import '../models/edit_name.dart';

class EditNamePlayer extends StatefulWidget {
  final String initialName;
  final Function(String value) setName;
  EditNamePlayer(this.initialName, this.setName);

  @override
  _EditNamePlayerState createState() => _EditNamePlayerState();
}

class _EditNamePlayerState extends State<EditNamePlayer> {
  final EditName editName = EditName();
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialName);
    editName.setName(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: controller,
              autofocus: true,
              onChanged: editName.setName,
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: Observer(builder: (context) {
                return CustomButton(
                  buttonText: "Salvar",
                  backGroundColor: Theme.of(context).accentColor,
                  textColor: Theme.of(context).splashColor,
                  onPressed: editName.isValid
                      ? () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          widget.setName(controller.text);
                          Navigator.pop(context);
                        }
                      : null,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
