import 'package:flutter/material.dart';
import 'package:news_c17/api/api_manager.dart';
import 'package:news_c17/model/source.dart';

import 'article_wiget.dart';

class NewsList extends StatelessWidget {
  final Source source;

  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadArticles(source.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          } else if (snapshot.hasData) {
            var articles = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) => ArticleWidget(
                    article: articles[index],
                  )),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
