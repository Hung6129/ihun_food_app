import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ihun_food_app/src/core/typedefs/type_defs.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/authenticate_repository.dart';

class AuthenticateRepositoryImplementation implements AuthenticateRepository {
  final AuthenticateRepository dataSource;

  AuthenticateRepositoryImplementation(this.dataSource);

  @override
  FutureEither<bool> signInWithEmailAndPass(
      String email, String password) async {
    try {
      final result = await dataSource.signInWithEmailAndPass(email, password);
      return result.fold(
        (l) => Left(l),
        (r) => Right(r),
      );
    } on DioException catch (e, str) {
      return Left(
        ServerFailure(
          e.toString(),
          str,
        ),
      );
    }
  }

  @override
  Future<bool> signOut() {
    throw UnimplementedError();
  }

  @override
  FutureEither<bool> signUpWithEmailAndPass(
      String userName, String email, String password) {
    throw UnimplementedError();
  }
}
