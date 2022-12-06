import 'package:flutter/material.dart';

class InputFormApp extends StatelessWidget {

  TextEditingController controller;
  String labelText;
  String hintText;
  TextInputType keyboardType;
  Function(String?) validator;
  Function(String?) onSaved;

  InputFormApp({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.keyboardType = TextInputType.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown,
            width: 3.0,
          ),
        ),
      ),
      autocorrect: false,
      style: const TextStyle(fontSize: 20),
      validator: (value) => validator(value),
      onSaved: (value) => onSaved(value),
    );
  }
}
