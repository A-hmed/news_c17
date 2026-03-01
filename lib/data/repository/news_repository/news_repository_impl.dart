import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/data/mapper/sources_mapper.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_c17/domain/model/source.dart';
import 'package:news_c17/domain/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsLocalDataSource localDataSource;
  NewsRemoteDataSource remoteDataSource;
  Connectivity connectivity;
  SourcesMapper sourcesMapper;

  NewsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.connectivity,
      required this.sourcesMapper});

  Future<List<Source>> loadSources(String categoryName) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var remoteSources = await remoteDataSource.loadSources(categoryName);
      localDataSource.saveSources(categoryName, remoteSources);
      return sourcesMapper.toSources(remoteSources);
    } else {
      return sourcesMapper
          .toSources(await localDataSource.loadSources(categoryName) ?? []);
    }
  }
}

/// Widget -> ViewModel -> UseCase -> Repository -> Datasource
