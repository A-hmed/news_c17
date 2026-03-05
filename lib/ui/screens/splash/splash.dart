import 'package:flutter/material.dart';
import 'package:news_c17/ui/extensions/context_extensions.dart';
import 'package:news_c17/ui/utils/app_assets.dart';
import 'package:news_c17/ui/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.push(context, AppRoutes.categoriesScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(context.themeProvider.isDarkMode
          ? AppAssets.splashDark
          : AppAssets.splashLight),
    );
  }
}
