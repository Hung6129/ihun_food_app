import 'package:equatable/equatable.dart';

/// This typedef is used to define a function that returns a FutureEither
abstract class Failure extends Equatable {
  final String message;
  final StackTrace stackTrace;
  const Failure(
    this.message,
    this.stackTrace,
  );

  String get errorMessage => '$stackTrace Error: $message';

  @override
  List<Object?> get props => [message, stackTrace];
}

class ServerFailure extends Failure {
  const ServerFailure(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
