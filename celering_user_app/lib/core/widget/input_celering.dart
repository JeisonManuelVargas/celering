import 'package:flutter/material.dart';

class InputCelering extends StatelessWidget {
  final String label;
  final Function(dynamic)? validator;
  final TextEditingController controller;

  static OutlineInputBorder borderSide = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.white10,
      width: 0.5,
    ),
  );
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 0.5,
    ),
  );

  const InputCelering({
    Key? key,
    this.validator,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (e) => validator != null ? validator!(e) : null,
      decoration: InputDecoration(
        filled: true,
        counterText: "",
        hintText: label,
        border: borderSide,
        fillColor: Colors.orange,
        focusedBorder: borderSide,
        enabledBorder: enabledBorder,
        disabledBorder: enabledBorder,
      ),
    );
  }
}
