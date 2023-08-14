import '../../models/product_model.dart';
import 'products_repo.dart';

abstract class ProductsServices {
  Future<List<ProductModel>> getProducts();
}

class ProductsRepoImpl implements ProductsServices {
  final ProductsRepo productsRepo = ProductsRepo();

  @override
  Future<List<ProductModel>> getProducts() async {
    return await productsRepo.getProducts();
  }
}
