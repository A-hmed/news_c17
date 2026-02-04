import 'package:flutter/material.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

extension BuildContextExtensions on BuildContext {
  ThemeProvider get themeProvider => Provider.of(this);

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  Color get primary => Theme.of(this).primaryColor;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
