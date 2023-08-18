import '../typedefs/type_defs.dart';

/// UseCaseWithParams is a class that can be extended to create a use case
abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();
  FutureEither<T> call(Params params);
}

/// UseCaseWithOutParams is a class that can be extended to create a use case
abstract class UseCaseWithOutParams<T> {
  const UseCaseWithOutParams();
  FutureEither<T> call();
}
