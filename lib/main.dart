import 'package:flutter/material.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:news_c17/ui/screens/categories/categories_screen.dart';
import 'package:news_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_tab.dart';
import 'package:news_c17/ui/screens/splash/splash_screen.dart';
import 'package:news_c17/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

///Http Request ->
/// Link -> $baseUrl/$apiName(EndPoint)?QueryParameters(variableName=value)
/// Link -> $baseUrl/$apiName $PathVariable
/// Request Type -> Get - Post - PUT - PATCH - DELETE - UPDATE
/// Body -> Json - xml - html
/// Headers

/// Http Response ->
/// status code 200
/// Body -> Json
/// Headers


void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///Get theme provider + Register this widget as a listener
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,

      home: CategoriesScreen(),
    );
  }
}
