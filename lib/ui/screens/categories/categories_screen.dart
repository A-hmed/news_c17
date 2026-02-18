import 'package:flutter/material.dart';
import 'package:news_c17/model/app_category.dart';
import 'package:news_c17/ui/extensions/context_extensions.dart';
import 'package:news_c17/ui/widgets/app_category_widget.dart';
import 'package:news_c17/ui/widgets/app_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Good Morning \nHere is Some News For You",
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: AppCategory.categories.length,
                    itemBuilder: (context, index) {
                      return AppCategoryWidget(
                        category: AppCategory.categories[index],
                        index: index,
                      );
                    }))
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
