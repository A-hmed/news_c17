import 'package:flutter/material.dart';
import 'package:news_c17/ui/extensions/context_extensions.dart';
import 'package:news_c17/ui/utils/app_assets.dart';
import 'package:news_c17/ui/utils/int_extension.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

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
            child: Image.asset(
              AppAssets.splashDark,
              height: context.height * .2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          10.verticalSpace,
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: context.textTheme.bodyLarge,
          ),
          10.verticalSpace,
          Row(
            children: [
              Text(
                "By : Jon Haworth",
                style: context.textTheme.labelMedium,
              ),
              Spacer(),
              Text(
                "15 minutes ago",
                style: context.textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
