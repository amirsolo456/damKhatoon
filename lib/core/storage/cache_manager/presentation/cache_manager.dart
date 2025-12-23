import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';

class CacheManager {
  static final CacheManager _singleton = CacheManager();
  AsyncMemoizer<Widget> cache = AsyncMemoizer<Widget>();

  factory CacheManager() {
    return _singleton;
  }

  CacheManager._();

  void invalidateTemporaryCache() {}
}
