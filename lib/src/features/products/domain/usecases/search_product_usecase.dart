import 'package:ihun_food_app/src/core/typedefs/type_defs.dart';

import '../../../../core/usecases/usecases.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class SearchProductUseCase
    extends UseCaseWithParams<List<ProductEntity>, String> {
  final ProductRepository _repository;
  const SearchProductUseCase(this._repository);

  @override
  FutureEither<List<ProductEntity>> call(String params) {
    return _repository.searchProduct(params);
  }
}
