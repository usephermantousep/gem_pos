import 'package:flutter/material.dart';
import 'package:gempos/global/models.dart';
import 'package:gempos/global/screens.dart';

//Route Name
const String loginScreen = 'loginScreen';
const String homeScreen = 'homeScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    default:
      throw ('No route');
  }
}
