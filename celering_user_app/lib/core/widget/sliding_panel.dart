import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:celering_user_app/core/util/screen_size.dart';

class SlidingPanel extends StatelessWidget {
  final Widget child;
  final double minHeight;
  final double? maxHeight;
  final PanelController controller;
  final Widget Function(ScrollController sc) panelBuilder;

  const SlidingPanel({
    Key? key,
    this.maxHeight,
    this.minHeight = 0,
    required this.child,
    required this.controller,
    required this.panelBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: minHeight,
      controller: controller,
      panelBuilder: panelBuilder,
      maxHeight: maxHeight??ScreenSize.height(context) * 0.7,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(ScreenSize.height(context) * 0.03),
        topRight: Radius.circular(ScreenSize.height(context) * 0.03)
      ),
      body: child,
    );
  }
}
