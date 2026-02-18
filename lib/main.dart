import 'package:flutter/material.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:news_c17/ui/screens/categories/categories_screen.dart';
import 'package:news_c17/ui/screens/navigation_screen/news_screen.dart';
import 'package:news_c17/ui/screens/navigation_screen/tabs/news/news_tab.dart';
import 'package:news_c17/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

/// HTTP Request ->
/// Link -> BaseUrl+ApiName(EndPoint)?QueryParameters
/// Link -> BaseUrl+ApiName+PathVariable
///Type -> GET - POST - PATCH - PUT - DELETE - UPDATE
///Body(JSON)
///Headers(Json)
//////////////////////
///HTTP RESPONSE ->
/// STATUS CODES
/// BODY(Json - html - xml)
/// headers

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      home: CategoriesScreen(),
    );
  }
}
