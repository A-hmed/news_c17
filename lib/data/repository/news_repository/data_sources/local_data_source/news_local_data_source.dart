import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c17/model/source.dart';

class NewsLocalDataSource {
  Future<List<Source>?> loadSources(String categoryName) async {
    var box = await Hive.openBox("news");
    return box.get(categoryName) as List<Source>?;
  }

  Future<void> saveSources(String category, List<Source> sources) async {
    var box = await Hive.openBox("news");
    box.put(category, sources);
  }
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  Source read(BinaryReader reader) {
    return Source.fromJson(reader.read());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.write(obj.toJson());
  }
}
