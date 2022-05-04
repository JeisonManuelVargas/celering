import 'package:flutter/material.dart';

class InputCelering extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

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

  const InputCelering({Key? key, required this.onChanged, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
