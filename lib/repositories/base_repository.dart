abstract class BaseRepository<T> {
  Future<List<T>> getList(int page);

  Future<List<T>> getListByParentId(int parentId);

  Future<T?> get(int id);

  Future<T> add(T entity);

  Future<void> edit(T entity);

  Future<void> delete(int id);
}
