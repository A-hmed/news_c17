import 'package:injectable/injectable.dart';
import 'package:news_c17/domain/model/source.dart';
import 'package:news_c17/domain/repository/news_repository.dart';

@injectable
class LoadSourcesUseCase {
  NewsRepository newsRepository;
  LoadSourcesUseCase(this.newsRepository);

  Future<List<Source>> call(String category) {
    return newsRepository.loadSources(category);
  }
}
