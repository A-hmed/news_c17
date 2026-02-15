import 'package:flutter/material.dart';
import 'package:news_c17/model/articles.dart';
import 'package:news_c17/ui/extensions/context_extensions.dart';
import 'package:news_c17/ui/utils/int_extension.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.secondary)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              article.urlToImage ?? "",
              height: context.height * .2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          10.verticalSpace,
          Text(
            article.title ?? "",
            style: context.textTheme.bodyLarge,
          ),
          10.verticalSpace,
          Row(
            children: [
              Text(
                "By : ${article.author}",
                style: context.textTheme.labelMedium,
              ),
              Spacer(),
              Text(
                article.publishedAt ?? "",
                style: context.textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
