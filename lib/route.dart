import 'package:flutter/material.dart';
import 'package:amazon/authentication/Screens/auth_screen.dart';

Route<dynamic> generateroute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routename:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const AuthScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Screen not exist!")),
        ),
      );
  }
}
