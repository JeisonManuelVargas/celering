// ignore_for_file: constant_identifier_names
import 'dart:io';

import 'package:celering_user_app/features/search_view/data/models/place_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:celering_user_app/core/animations/fade_page_route.dart';
import 'package:celering_user_app/features/home/presentation/pages/home.dart';
import 'package:celering_user_app/features/search_view/presentation/pages/search_view.dart';

enum Routes {
  INIT,
  HOME,
  SEARCH,
}

class _Page {
  static const String init = "/init";
  static const String home = "/home";
  static const String search = "/search";

  static const Map<Routes, String> _pageMap = {
    Routes.INIT: init,
    Routes.HOME: home,
    Routes.SEARCH: search,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    PlaceModel placeModel = PlaceModel.fromJsonNoData();

    if (argument is PlaceModel) {
      placeModel = argument;
    }

    switch (settings.name) {
      case _Page.init:
        return _pageRoute(Home(placeSelected: placeModel));
      case _Page.home:
        return _pageRoute(Home(placeSelected: placeModel));
      case _Page.search:
        return _pageRoute(const SearchView());
      default:
        return _pageRoute(Home(placeSelected: placeModel));
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
