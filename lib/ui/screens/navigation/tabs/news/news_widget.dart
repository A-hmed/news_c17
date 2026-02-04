import 'package:flutter/material.dart';
import 'package:news_c17/ui/utils/app_assets.dart';
import 'package:news_c17/ui/utils/extension/context_extension.dart';
import 'package:news_c17/ui/utils/extension/int_extensions.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppAssets.splashLight,
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          12.verticalSpace(),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: context.textTheme.bodyMedium,
          ),
          12.verticalSpace(),
          Row(
            children: [
              Text(
                "By : Jon Haworth",
                style: context.textTheme.labelMedium,
              ),
              10.horizontalSpace(),
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
