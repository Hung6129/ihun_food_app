part of 'authenticate_bloc.dart';

sealed class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

final class AuthenticateFail extends AuthenticateState {
  final String message;

  const AuthenticateFail(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthenticateDone extends AuthenticateState {
  final bool status;

  const AuthenticateDone(this.status);

  @override
  List<Object> get props => [status];
}

final class AuthenticateLoading extends AuthenticateState {}

final class UnAuthenticate extends AuthenticateState {}
