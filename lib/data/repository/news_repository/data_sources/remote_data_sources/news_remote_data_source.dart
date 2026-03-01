import 'package:injectable/injectable.dart';
import '../../../../../../../E-commerce-c17/lib/features/network/api_client/api_client.dart';
import 'package:news_c17/apis/api_manager.dart';
import 'package:news_c17/data/model/remote_source.dart';
import 'package:news_c17/data/model/sources_response.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  ApiClient apiClient;

  NewsRemoteDataSourceImpl(this.apiClient);

  Future<List<RemoteSource>> loadSources(String categoryName) async {
    SourcesResponse sourcesResponse = await apiClient.loadSources(categoryName, ApiManager.apiKey);
    return sourcesResponse.sources!;
  }
}

abstract class NewsRemoteDataSource {
  Future<List<RemoteSource>> loadSources(String categoryName);
}
