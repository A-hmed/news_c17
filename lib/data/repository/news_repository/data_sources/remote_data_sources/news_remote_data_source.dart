import 'package:news_c17/apis/api_manager.dart';
import 'package:news_c17/model/source.dart';

class NewsRemoteDataSource{
  Future<List<Source>> loadSources(String categoryName) {
    return ApiManager.loadSources(categoryName);
  }
}