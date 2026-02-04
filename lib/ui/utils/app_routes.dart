import 'package:flutter/material.dart';

import '../screens/navigation_screen/navigation_screen.dart';

abstract final class AppRoutes {
  static Route get navigationScreen =>
      MaterialPageRoute(builder: (_) => const NavigationScreen());
}
