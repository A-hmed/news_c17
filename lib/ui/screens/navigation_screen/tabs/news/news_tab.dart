import 'package:flutter/material.dart';
import 'package:news_c17/api/api_manager.dart';
import 'package:news_c17/model/app_category.dart';
import 'package:news_c17/model/source.dart';
import 'package:provider/provider.dart';

import 'news_list.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;

  NewsTab(this.category, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => NewsViewModel(),
      child: Builder(builder: (context) {
        viewModel = Provider.of(context, listen: true);
        return viewModel.sources.isEmpty
            ? Center(child: CircularProgressIndicator())
            : buildTabsList(viewModel.sources);
      }),
    );
    // return
    // return FutureBuilder(
    //     future:,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Text(snapshot.error.toString());
    //       } else if (snapshot.hasData) {
    //         return buildTabsList(snapshot.data!);
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     });
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
                  children: sources
                      .map((source) => NewsList(
                            source: source,
                          ))
                      .toList()))
          //
        ],
      ),
    );
  }
}

class NewsViewModel extends ChangeNotifier {
  List<Source> sources = [];

  loadSources(String name) async {
    sources = await ApiManager.loadSources(name);
    notifyListeners();
  }
}
