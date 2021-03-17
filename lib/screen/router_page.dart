import 'package:flutter/material.dart';
import 'package:travel_apps/screen/add_screen.dart';
import 'package:travel_apps/screen/homescreen.dart';
import 'package:travel_apps/screen/update_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/addHotel':
        return MaterialPageRoute(builder: (_) => AddScreen());
      case '/editHotel':
        return MaterialPageRoute(builder: (_) => UpdateScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(
                        'Tidak ada rute yang ditentukan untuk ${settings.name}'),
                  ),
                ));
    }
  }
}
