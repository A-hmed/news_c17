import 'package:flutter/material.dart';
import 'package:news_c17/model/app_category.dart';
import 'package:news_c17/ui/screens/categories/categories_screen.dart';

import '../screens/navigation_screen/news_screen.dart';

abstract final class AppRoutes {
  static Route newsScreen(AppCategory category) =>
      MaterialPageRoute(builder: (_) => NewsScreen(category));

  static Route get categoriesScreen  =>
      MaterialPageRoute(builder: (_) => const CategoriesScreen());


}
