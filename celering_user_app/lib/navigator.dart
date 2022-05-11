// ignore_for_file: constant_identifier_names
import 'dart:io';

import 'package:celering_user_app/features/confirm_email/presentation/pages/confirm_email.dart';
import 'package:celering_user_app/features/register/presentation/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:celering_user_app/core/animations/fade_page_route.dart';
import 'package:celering_user_app/features/home/presentation/pages/home.dart';
import 'package:celering_user_app/features/login/presentation/pages/login.dart';

enum Routes {
  INIT,
  HOME,
  LOGIN,
  REGISTER,
  CONFIRMATION_EMAIL,
}

class _Page {
  static const String init = "/";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String confirmation_email = "/confirmationEmail";

  static const Map<Routes, String> _pageMap = {
    Routes.INIT: init,
    Routes.HOME: home,
    Routes.LOGIN: login,
    Routes.REGISTER: register,
    Routes.CONFIRMATION_EMAIL: confirmation_email,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    late String email;

    if (argument is String) {
      email = argument;
    }

    switch (settings.name) {
      case _Page.init:
        return _pageRoute(Login());
      case _Page.login:
        return _pageRoute(Login());
      case _Page.home:
        return _pageRoute(Home());
      case _Page.register:
        return _pageRoute(Register());
      case _Page.confirmation_email:
        return _pageRoute(ConfirmEmail(email: email));
      default:
        return _pageRoute(Home());
    }
  }

  static Route _pageRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (context) => page)
        : FadeRoute(page: page);
  }

  static Future push<T>(Routes route, [arguments]) => state.pushNamed(_Page.page(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, {arguments}) =>
      state.pushNamedAndRemoveUntil(_Page.page(route)!, (Route routes) => false,
          arguments: arguments);

  static void pop() => state.pop();
}
