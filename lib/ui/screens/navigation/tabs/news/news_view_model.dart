import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17/data/repository/news_repository/news_repository.dart';
import 'package:news_c17/ui/utils/resource.dart';

import '../../../../../model/source.dart';

class NewsViewModel extends Cubit<NewsState> {
  // Resource<List<Source>> sourcesApi = ;
  NewsViewModel() : super(NewsState(Resource.initial()));

  NewsRepository repository = NewsRepository();

  loadSources(String category) async {
    try {
      // sourcesApi = Resource.loading();
      // notifyListeners();
      emit(NewsState(Resource.loading()));

      var sources = await repository.loadSources(category);
      // sourcesApi =;
      emit(NewsState(Resource.success(sources)));
    } catch (e) {
      // sourcesApi = Resource.error(e.toString());
      emit(NewsState(Resource.error(e.toString())));
    }
    // notifyListeners();
  }
}

class NewsState {
  Resource<List<Source>> sourcesApi = Resource.initial();

  NewsState(this.sourcesApi);
}
