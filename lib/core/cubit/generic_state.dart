abstract class GenericState<T> {}

class GenericInitial<T> extends GenericState<T> {}

class GenericLoading<T> extends GenericState<T> {}

class GenericLoaded<T> extends GenericState<T> {
  final T data;

  GenericLoaded(this.data);
}

class GenericError<T> extends GenericState<T> {
  final String message;

  GenericError(this.message);
}
