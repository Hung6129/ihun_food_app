import 'package:ihun_food_app/src/core/typedefs/type_defs.dart';
import 'package:ihun_food_app/src/core/usecases/usecases.dart';
import 'package:ihun_food_app/src/features/authenticate/domain/entities/email_pass_entity.dart';
import 'package:ihun_food_app/src/features/authenticate/domain/repositories/authenticate_repository.dart';

class SignInUsecase extends UseCaseWithParams<bool, EmailAndPass> {
  const SignInUsecase(this._authenticateRepository);

  final AuthenticateRepository _authenticateRepository;
  @override
  FutureEither<bool> call(EmailAndPass params) {
    return _authenticateRepository.signInWithEmailAndPass(
      params.email,
      params.password,
    );
  }
}
