abstract class GenericCache<T> {
  Future<void> saveItems(List<T> items);

  Future<List<T>?> getCachedItems();
}
