import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final EdgeInsets myPadding;
  final String initialValue;
  final String label;
  final Function(String value) changed;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool autoFocus;
  final Function validator;
  final GlobalKey<FormFieldState> fieldKey;
  final bool textCenter;

  CustomTextField({
    this.myPadding: EdgeInsets.zero,
    this.initialValue,
    this.label,
    this.changed,
    this.textController,
    this.keyboardType: TextInputType.text,
    this.autoFocus: false,
    this.validator,
    this.fieldKey,
    this.textCenter: true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: TextFormField(
        key: fieldKey,
        controller: textController,
        autofocus: autoFocus,
        validator: validator,
        keyboardType: keyboardType,
        initialValue: initialValue,
        textAlign: textCenter ? TextAlign.center : TextAlign.left,
        onChanged: changed,
        decoration: InputDecoration(
          errorMaxLines: 2,
          labelText: label,
        ),
      ),
    );
  }
}
