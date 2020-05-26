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
        textAlign: TextAlign.center,
        onChanged: changed,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
