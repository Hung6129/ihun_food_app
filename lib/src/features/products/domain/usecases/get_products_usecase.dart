import '../../../../core/typedefs/type_defs.dart';
import '../../../../core/usecases/usecases.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// GetProductsUsecase is a class that can be extended to create a use case for getting products
/// from the repository.
/// It extends the [UseCaseWithOutParams] class from the core module.
/// And uses the [ProductRepository] to get the products.
/// returns a [FutureEither] of a list of [ProductEntity].

class GetProductsUsecase extends UseCaseWithOutParams<List<ProductEntity>> {
  const GetProductsUsecase(this._repository);

  final ProductRepository _repository;

  @override
  FutureEither<List<ProductEntity>> call() {
    return _repository.getProducts();
  }
}
