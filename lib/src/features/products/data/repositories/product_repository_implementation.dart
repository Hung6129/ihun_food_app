import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ihun_food_app/src/core/typedefs/type_defs.dart';
import 'package:ihun_food_app/src/features/products/data/models/product_model.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_src/product_remote_datasource.dart';

/// ProductRepositoryImplamentation is a class that implements the [ProductRepository] interface.
/// It uses the [ProductRemoteDataSource] to get the products.
/// returns a [FutureEither] of a list of [ProductModel].

class ProductRepositoryImplementation implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImplementation(
    this._remoteDataSource,
  );
  @override
  FutureEither<List<ProductModel>> getProducts() async {
    try {
      final products = await _remoteDataSource.getProducts();
      return Right(products);
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
  FutureEither<List<ProductModel>> searchProduct(String query) async {
    try {
      final products = await _remoteDataSource.searchProduct(query);
      return Right(products);
    } on DioException catch (e, str) {
      return Left(
        ServerFailure(
          e.toString(),
          str,
        ),
      );
    }
  }
}
