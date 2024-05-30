extension IterableExtensions<T> on Iterable<T> {
  Iterable<TResult> selectMany<TResult>(Iterable<TResult> Function(T element) selector) sync* {
    for (var v in this) {
      yield* selector(v);
    }
  }
}
