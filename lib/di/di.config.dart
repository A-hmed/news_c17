// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../E-commerce-c17/lib/features/network/api_client/api_client.dart' as _i588;
import '../data/mapper/sources_mapper.dart' as _i1018;
import '../data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart'
    as _i259;
import '../data/repository/news_repository/data_sources/remote_data_sources/news_remote_data_source.dart'
    as _i681;
import '../data/repository/news_repository/news_repository_impl.dart' as _i674;
import '../domain/repository/news_repository.dart' as _i263;
import '../domain/usecases/load_sources_usecase.dart' as _i73;
import '../ui/screens/navigation/tabs/news/news_view_model.dart' as _i451;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItModule = _$GetItModule();
    gh.factory<_i895.Connectivity>(() => getItModule.createConnectivity());
    gh.factory<_i1018.SourcesMapper>(() => _i1018.SourcesMapper());
    gh.lazySingleton<_i361.Dio>(() => getItModule.createDio());
    gh.factory<_i259.NewsLocalDataSource>(
        () => _i259.NewsLocalDataSourceImpl());
    gh.singleton<_i588.ApiClient>(() => _i588.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i681.NewsRemoteDataSource>(
        () => _i681.NewsRemoteDataSourceImpl(gh<_i588.ApiClient>()));
    gh.factory<_i263.NewsRepository>(() => _i674.NewsRepositoryImpl(
          remoteDataSource: gh<_i681.NewsRemoteDataSource>(),
          localDataSource: gh<_i259.NewsLocalDataSource>(),
          connectivity: gh<_i895.Connectivity>(),
          sourcesMapper: gh<_i1018.SourcesMapper>(),
        ));
    gh.factory<_i73.LoadSourcesUseCase>(
        () => _i73.LoadSourcesUseCase(gh<_i263.NewsRepository>()));
    gh.factory<_i451.NewsViewModel>(
        () => _i451.NewsViewModel(gh<_i73.LoadSourcesUseCase>()));
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
