import 'package:ecommerce_template/page/main_page.dart';
import 'package:flutter/material.dart';

class MainRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const MainPage());
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
