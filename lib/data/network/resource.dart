typedef AwaitSource<T> = Stream<Resource<T>>;

class Resource<T extends dynamic> {
  Resource._();

  factory Resource.success(T data) = Success;

  factory Resource.error(String message) = Error;

  factory Resource.loading() = Loading;
}

class Success<T> extends Resource<T> {
  Success(this.data) : super._();

  final T data;
}

class Error<T> extends Resource<T> {
  Error(this.message) : super._();
  final String message;
}

class Loading<T> extends Resource<T> {
  Loading() : super._();
}
