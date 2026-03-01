import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17/data/mapper/sources_mapper.dart';
import 'package:news_c17/data/model/category.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_c17/data/repository/news_repository/news_repository_impl.dart';
import 'package:news_c17/di/di.dart';
import 'package:news_c17/domain/model/source.dart';
import 'package:news_c17/domain/usecases/load_sources_usecase.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_list.dart';

import '../../../../utils/resource.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;

  const NewsTab(this.category, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
  }

  /// BlocProvider - BlocListener - BlocBuilder
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
        if (state.sourcesApi.status == ApiStatus.error) {
          return Text(state.sourcesApi.errorMessage ?? "");
        } else if (state.sourcesApi.status == ApiStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return buildTabsList(state.sourcesApi.data ?? []);
        }
      }),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => NewsViewModel(),
    //   child: Builder(builder: (context) {
    //     return Consumer<NewsViewModel>(builder: (context, viewModel, _) {
    //       this.viewModel = viewModel;
    //     });
    //   }),
    // );

    // return FutureBuilder(
    //     future: ApiManager.loadSources(widget.category.name),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return AppErrorWidget(message: snapshot.error.toString());
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
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                children:
                    sources.map((source) => NewsList(source: source)).toList()),
          )
        ],
      ),
    );
  }
}
