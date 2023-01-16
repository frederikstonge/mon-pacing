abstract class BaseRepository<T> {
  Future<List<T>> getList(int skip, int take);

  Future<T?> get(int id);

  Future<T> add(T entity);

  Future<void> edit(T entity);

  Future<void> delete(int id);
}
