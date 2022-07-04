import 'dart:developer';

import 'package:tpfinal/screens/characters.dart';
import 'package:tpfinal/screens/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String second = '/second';
  static const String characters = '/characters';
}

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(
          builder: (_) => const MyHomePage(), settings: settings);

    case Routes.characters:
      return MaterialPageRoute(
          builder: (_) => CharactersPage(
                title: "Characters",
              ),
          settings: settings);

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Text("404"),
              ),
          settings: settings);
  }
}
