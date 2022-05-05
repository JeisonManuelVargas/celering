import 'package:flutter/material.dart';
import 'package:celering_user_app/core/util/screen_size.dart';

class ButtonCelering extends StatelessWidget {
  final String label;
  final Function() onTap;

  const ButtonCelering({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      borderRadius: BorderRadius.circular(
        ScreenSize.height(context) * 0.03,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenSize.height(context) * 0.03,
          ),
          alignment: Alignment.center,
          child: Text(label),
        ),
      ),
    );
  }
}