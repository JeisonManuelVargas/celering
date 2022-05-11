import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() handledButton;
  final IconData icon;

  const CustomButton(
      {Key? key, required this.handledButton, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Material(
        elevation: 5,
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => handledButton(),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
