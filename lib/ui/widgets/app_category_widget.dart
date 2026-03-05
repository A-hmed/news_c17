import 'package:flutter/material.dart';
import 'package:news_c17/model/app_category.dart';
import 'package:news_c17/ui/extensions/context_extensions.dart';
import 'package:news_c17/ui/providers/theme_provider.dart';
import 'package:news_c17/ui/utils/app_routes.dart';
import 'package:news_c17/ui/utils/int_extension.dart';
import 'package:provider/provider.dart';

class AppCategoryWidget extends StatelessWidget {
  final AppCategory category;
  final int index;

  const AppCategoryWidget(
      {super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    return InkWell(
      onTap: (){
        Navigator.push(context, AppRoutes.newsScreen(category));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                  provider.isDarkMode ? category.imageLight : category.imageDark),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: index.isEven
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      category.name,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  42.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: context.primary.withAlpha(125),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index.isEven) ...[
                          16.horizontalSpace,
                          Text(
                            "View All",
                            style: context.textTheme.titleLarge,
                          ),
                          10.horizontalSpace,
                          CircleAvatar(
                            backgroundColor: context.primary,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: context.secondary,
                            ),
                          )
                        ],
                        if (index.isOdd) ...[
                          CircleAvatar(
                            backgroundColor: context.primary,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: context.secondary,
                            ),
                          ),
                          10.horizontalSpace,
                          Text(
                            "View All",
                            style: context.textTheme.titleLarge,
                          ),
                          16.horizontalSpace
                        ]
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
