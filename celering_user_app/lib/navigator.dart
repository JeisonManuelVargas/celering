// ignore_for_file: constant_identifier_names
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:celering_user_app/core/animations/fade_page_route.dart';
import 'package:celering_user_app/features/home/presentation/pages/home.dart';
import 'package:celering_user_app/features/login/presentation/pages/login.dart';

enum Routes {
  INIT,
  HOME,
  LOGIN,
}

class _Page {
  static const String init = "/";
  static const String home = "/home";
  static const String login = "/login";

  static const Map<Routes, String> _pageMap = {
    Routes.INIT: init,
    Routes.HOME: home,
    Routes.LOGIN: login,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case _Page.init:
        return _pageRoute(Login());
      case _Page.login:
        return _pageRoute(Login());
      case _Page.home:
        return _pageRoute(Home());
      default:
        return _pageRoute(Home());
    }
  }

  static Route _pageRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (context) => page)
        : FadeRoute(page: page);
  }

  static Future push<T>(Routes route) => state.pushNamed(_Page.page(route)!);

  static Future pushNamedAndRemoveUntil<T>(Routes route, {arguments}) =>
      state.pushNamedAndRemoveUntil(_Page.page(route)!, (Route routes) => false,
          arguments: arguments);

  static void pop() => state.pop();
}
