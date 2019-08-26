import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// Created  on 2019/8/26.
/// @author grey
/// Function :

class HtmlImageCacheManager extends BaseCacheManager {
  static const key = 'htmlCache';

  static HtmlImageCacheManager _instance;

  factory HtmlImageCacheManager() {
    if (_instance == null) {
      _instance = HtmlImageCacheManager();
    }
    return _instance;
  }

  @override
  Future<String> getFilePath() async{
    var dir = await getTemporaryDirectory();
    return p.join(dir.path,key);
  }
}
