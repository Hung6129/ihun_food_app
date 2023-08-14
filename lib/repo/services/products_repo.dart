import 'package:dio/dio.dart';
import 'package:ihun_food_app/core/app_urls.dart';
import 'package:ihun_food_app/models/product_model.dart';

class ProductsRepo {
  Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(AppUrls.baseUrl + AppUrls.allProducts);
    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;

      final products = data.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } else {
      throw Exception("Failed to get products list");
    }
  }
}
