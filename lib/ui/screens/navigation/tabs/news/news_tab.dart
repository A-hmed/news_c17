import 'package:flutter/material.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_list.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
            tabs: [
              Tab(
                child: Text("Tab1"),
              ),
              Tab(
                child: Text("Tab2"),
              ),
              Tab(
                child: Text("Tab3"),
              ),
            ],
          ),
        ),
        Expanded(child: NewsList()),
      ],
    );
  }
}
