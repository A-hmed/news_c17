import 'package:flutter/material.dart';

import 'news_list.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          buildTabBar(),
          NewsList()
        ],
      ),
    );
  }

  buildTabBar() {
    return TabBar(tabs: [
      Tab(text: "ABC News",),
      Tab(text: "Aftenposten",),
      Tab(text: "ANSA.it",)
    ]);
  }
}
