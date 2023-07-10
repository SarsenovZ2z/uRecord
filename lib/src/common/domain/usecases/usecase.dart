abstract class UseCase<T, P> {
  const UseCase();

  Future<T> call(P params);
}

abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();

  Future<T> call();
}