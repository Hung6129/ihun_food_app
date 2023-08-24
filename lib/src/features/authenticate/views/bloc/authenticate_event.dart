part of 'authenticate_bloc.dart';

sealed class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

final class AuthenWithEmailAndPass extends AuthenticateEvent {
  final EmailAndPass _emailAndPass;

  const AuthenWithEmailAndPass(this._emailAndPass);

  @override
  List<Object> get props => [_emailAndPass];
}
