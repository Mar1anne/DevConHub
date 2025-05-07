import 'package:devcon_hub/core/cache/generic_cache.dart';

class InMemoryCache<T> implements GenericCache<T> {
  List<T>? _cache;

  @override
  Future<void> saveItems(List<T> items) async {
    _cache = items;
  }

  @override
  Future<List<T>?> getCachedItems() async {
    return _cache;
  }
}
