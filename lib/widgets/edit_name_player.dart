import 'package:flutter/material.dart';
import '../validators/form_validators.dart';
import './custom_button.dart';
import './custom_text_field.dart';

class EditNamePlayer extends StatefulWidget {
  final TextEditingController controller;
  final String initialValue;
  final Function(String value) setName;
  EditNamePlayer({
    this.controller,
    this.initialValue,
    this.setName,
  });

  @override
  _EditNamePlayerState createState() => _EditNamePlayerState();
}

class _EditNamePlayerState extends State<EditNamePlayer> {
  final fieldKey = GlobalKey<FormFieldState>();

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
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(
              autoFocus: true,
              fieldKey: fieldKey,
              label: "Nome",
              textController: widget.controller,
              validator: FormValidators.name,
            ),
            SizedBox(height: 20),
            CustomButton(
              buttonText: "Salvar",
              backGroundColor: Theme.of(context).accentColor,
              textColor: Theme.of(context).splashColor,
              onPressed: () {
                if (fieldKey.currentState.validate()) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.setName(widget.controller.text);
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(height: 10),
            CustomButton(
              buttonText: "Cancelar",
              backGroundColor: Colors.transparent,
              borderColor: Colors.red,
              textColor: Colors.black,
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
