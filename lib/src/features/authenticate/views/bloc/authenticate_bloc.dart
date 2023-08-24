import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ihun_food_app/src/features/authenticate/domain/entities/email_pass_entity.dart';

import '../../domain/usecases/sign_in_usecase.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc({
    required SignInUsecase signInUsecase,
  })  : _signInUsecase = signInUsecase,
        super(UnAuthenticate()) {
    on<AuthenWithEmailAndPass>(onAuthenticate);
  }
  final SignInUsecase _signInUsecase;
  void onAuthenticate(
      AuthenWithEmailAndPass event, Emitter<AuthenticateState> emit) async {
    emit(AuthenticateLoading());
    try {
      final emailAndPass = event._emailAndPass;
      if (emailAndPass.email.isEmpty || emailAndPass.password.isEmpty) {
        emit(
          const AuthenticateFail('Email and password must not be empty'),
        );
      } else {
        final result = await _signInUsecase(emailAndPass);
        print('29 result $result');
        result.fold(
            (l) => emit(
                  AuthenticateFail(l.errorMessage),
                ), (r) {
          if (r) {
            emit(
              AuthenticateDone(r),
            );
          } else {
            emit(
              const AuthenticateFail('Email or password is incorrect'),
            );
          }
        });
      }
    } catch (e) {
      return emit(
        AuthenticateFail(e.toString()),
      );
    }
  }
}
