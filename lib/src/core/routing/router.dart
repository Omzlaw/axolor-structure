import 'package:axolor_mobile/src/features/launch_pad/presentation/screens/launch_pad_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/launch-pad':
        return MaterialPageRoute(builder: (_) => const LaunchPadScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LaunchPadScreen());
    }
  }
}
