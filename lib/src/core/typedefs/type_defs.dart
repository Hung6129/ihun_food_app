import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

/// This typedef is used to define a function that returns a FutureEither
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureEitherBool = FutureEither<bool>;
typedef FutureVoid = Future<void>;
