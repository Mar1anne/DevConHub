import 'package:flutter_test/flutter_test.dart';
import 'package:devcon_hub/core/cache/in_memory_cache.dart';

void main() {
  group('InMemoryCache', () {
    late InMemoryCache<String> cache;

    setUp(() {
      cache = InMemoryCache<String>();
    });

    test('initially returns null when cache is empty', () async {
      final result = await cache.getCachedItems();
      expect(result, isNull);
    });

    test('saves and retrieves cached items correctly', () async {
      final items = ['a', 'b', 'c'];

      await cache.saveItems(items);
      final result = await cache.getCachedItems();

      expect(result, isNotNull);
      expect(result, equals(items));
    });

    test('overwrites previous cache when saveItems is called again', () async {
      await cache.saveItems(['a']);
      await cache.saveItems(['x', 'y']);

      final result = await cache.getCachedItems();

      expect(result, equals(['x', 'y']));
    });
  });
}
