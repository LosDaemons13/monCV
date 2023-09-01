import 'package:flutter/material.dart';
import '../screens/category/homepage.dart';

class RouteManager {
  static const String homePage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      default:
        throw const FormatException('Aucune route trouvée');
    }
  }
}
