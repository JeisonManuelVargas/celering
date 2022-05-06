import 'package:flutter/cupertino.dart';

class TitleCelering extends StatelessWidget {
  final String title;

  const TitleCelering({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 30,
        ),
      ),
    );
  }
}
