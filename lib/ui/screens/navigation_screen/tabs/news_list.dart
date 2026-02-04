import 'package:flutter/material.dart';
import 'package:news_c17/ui/screens/navigation_screen/tabs/article_wiget.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 100, itemBuilder: (context, index) => ArticleWidget()),
    );
  }
}
