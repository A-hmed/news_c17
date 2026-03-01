import 'package:injectable/injectable.dart';
import 'package:news_c17/data/model/remote_source.dart';
import 'package:news_c17/domain/model/source.dart';

@injectable
class SourcesMapper {
  Source toSource(RemoteSource remoteSource) {
    return Source(remoteSource.id ?? "", remoteSource.name ?? " ");
  }

  List<Source> toSources(List<RemoteSource> remoteSources) {
    return remoteSources.map((remoteSource) => toSource(remoteSource)).toList();
  }
}
