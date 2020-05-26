import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final EdgeInsets myPadding;
  final String initialValue;
  final String label;
  final Function(String value) changed;
  final TextEditingController textController;
  final TextInputType keyboardType;

  CustomTextField({
    this.myPadding: EdgeInsets.zero,
    this.initialValue,
    this.label,
    this.changed,
    this.textController,
    this.keyboardType: TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: TextFormField(
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
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
