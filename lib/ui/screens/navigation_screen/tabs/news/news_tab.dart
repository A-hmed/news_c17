import 'package:flutter/material.dart';
import 'package:news_c17/api/api_manager.dart';
import 'package:news_c17/model/source.dart';

import 'news_list.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
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
                  .map((source) => Tab(
                        child: Text(source.name ?? ""),
                      ))
                  .toList()),
          Expanded(
              child: TabBarView(
                  children: sources.map((source) => NewsList(source: source,)).toList()))
          //
        ],
      ),
    );
  }
}
