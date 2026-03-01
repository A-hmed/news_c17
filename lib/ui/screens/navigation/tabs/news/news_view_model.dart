import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/domain/model/source.dart';
import 'package:news_c17/domain/usecases/load_sources_usecase.dart';
import 'package:news_c17/ui/utils/resource.dart';

@injectable
class NewsViewModel extends Cubit<NewsState> {
  // Resource<List<Source>> sourcesApi = ;
  NewsViewModel(this.loadSourcesUseCase) : super(NewsState(Resource.initial()));

  LoadSourcesUseCase loadSourcesUseCase;

  loadSources(String category) async {
    try {
      // sourcesApi = Resource.loading();
      // notifyListeners();
      emit(NewsState(Resource.loading()));

      var sources = await loadSourcesUseCase(category);
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
