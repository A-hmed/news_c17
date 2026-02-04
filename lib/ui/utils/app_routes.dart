import 'package:flutter/material.dart';
import 'package:news_c17/ui/screens/navigation/navigation_screen.dart';

abstract final class AppRoutes {
  static Route get navigationScreen =>
      MaterialPageRoute(builder: (_) => NavigationScreen());
}
