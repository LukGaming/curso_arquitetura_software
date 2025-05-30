sealed class Result<T> {
  const Result();
  factory Result.ok(T value) = Ok._;
  factory Result.error(Exception error) = Error._;
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;
}

final class Error<T> extends Result<T> {
  const Error._(this.error);
  final Exception error;
}

extension ResultCasting<T> on Result<T> {
  Ok<T> get asValue => this as Ok<T>;

  Error<T> get asError => this as Error<T>;
}


// Ok("String")