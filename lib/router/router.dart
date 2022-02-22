import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const homeRoute = WelcomeScreen.routeName;

  static const screensOptions = <_ScreenRoute>[
    _ScreenRoute(
      route: ChatScreen.routeName,
      screen: ChatScreen(),
    ),
    _ScreenRoute(
      route: WelcomeScreen.routeName,
      screen: WelcomeScreen(),
    ),
    _ScreenRoute(
      route: RegistrationScreen.routeName,
      screen: RegistrationScreen(),
    ),
    _ScreenRoute(
      route: LoginScreen.routeName,
      screen: LoginScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> get getAppRoutes {
    final appRoutes = <String, Widget Function(BuildContext)>{};
    for (final option in screensOptions) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }
    return appRoutes;
  }
}

class _ScreenRoute {
  final String route;
  final Widget screen;

  const _ScreenRoute({
    required this.route,
    required this.screen,
  });
}
