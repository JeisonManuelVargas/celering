import 'package:celering_user_app/core/util/screen_size.dart';
import 'package:flutter/cupertino.dart';

class TitleCelering extends StatelessWidget {
  final String title;

  const TitleCelering({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
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
