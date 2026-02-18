import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_c17/model/source.dart';

class NewsRepository {
  NewsLocalDataSource localDataSource = NewsLocalDataSource();
  NewsRemoteDataSource remoteDataSource = NewsRemoteDataSource();
  Connectivity connectivity = Connectivity();

  Future<List<Source>> loadSources(String categoryName) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var sources = await remoteDataSource.loadSources(categoryName);
      localDataSource.saveSources(categoryName,sources);
      return sources;
    } else {
      return await localDataSource.loadSources(categoryName) ?? [];
    }
  }
}
