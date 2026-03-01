import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/data/mapper/sources_mapper.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c17/data/repository/news_repository/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_c17/data/repository/news_repository/news_repository_impl.dart';
import 'package:news_c17/di/di.config.dart';
import 'package:news_c17/domain/usecases/load_sources_usecase.dart';
import 'package:news_c17/ui/screens/navigation/tabs/news/news_view_model.dart';

import '../domain/repository/news_repository.dart';

final getIt = GetIt.instance;


@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void initDependencies() => getIt.init();

// initDependencies() {
//   getIt.registerFactory<SourcesMapper>(() => SourcesMapper());
//   getIt.registerFactory<Connectivity>(() => Connectivity());
//   getIt.registerFactory<NewsRemoteDataSource>(()=> NewsRemoteDataSourceImpl());
//   getIt.registerFactory<NewsLocalDataSource>(()=> NewsLocalDataSourceImpl());
//   getIt.registerFactory<NewsRepository>(() => NewsRepositoryImpl(
//       remoteDataSource: getIt(),
//       localDataSource: getIt(),
//       connectivity: getIt(),
//       sourcesMapper: getIt()));
//
//   getIt.registerFactory<LoadSourcesUseCase>(() => LoadSourcesUseCase(getIt()));
//   getIt.registerFactory<NewsViewModel>(() => NewsViewModel(getIt()));
// }
