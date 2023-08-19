import 'package:ihun_food_app/src/core/typedefs/type_defs.dart';

import '../entities/product.dart';

/// ProductRepository is an abstract class that can be extended
/// to create a repository for [ProductEntity]
/// It has a method [getProducts] that returns a [FutureEither] of a list of [ProductEntity]

abstract class ProductRepository {
  const ProductRepository();

  FutureEither<List<ProductEntity>> getProducts();

  FutureEither<List<ProductEntity>> searchProduct(String query);
}
