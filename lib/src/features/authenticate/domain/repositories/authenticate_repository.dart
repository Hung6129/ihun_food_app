import '../../../../core/typedefs/type_defs.dart';

abstract class AuthenticateRepository {
  const AuthenticateRepository();

  FutureEither<bool> signInWithEmailAndPass(
    String email,
    String password,
  );

  FutureEither<bool> signUpWithEmailAndPass(
    String userName,
    String email,
    String password,
  );

  Future<bool> signOut();
}
