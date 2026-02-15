import 'package:flutter/material.dart';
import 'package:news_c17/apis/api_manager.dart';
import 'package:news_c17/model/category.dart';
import 'package:news_c17/model/source.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_list.dart';
import 'package:news_c17/ui/widgets/app_error_widget.dart';

class NewsTab extends StatelessWidget {
  final AppCategory category;
  const NewsTab(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadSources(category.name),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppErrorWidget(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return buildTabsList(snapshot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sources
                .map((source) =>
                Tab(
                  child: Text(source.name ?? ""),
                ))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                children: sources
                    .map((source) => NewsList(source: source))
                    .toList()),
          )
        ],
      ),
    );
  }
}
