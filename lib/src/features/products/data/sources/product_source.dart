import 'dart:io';

import 'package:ihun_food_app/src/features/products/data/models/product_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/app_urls.dart';
import '../../../../core/errors/failure.dart';

/// ProductSource is an abstract class that defines the methods
/// that the [ProductSourceImplementation] class must implement.
/// The [ProductSourceImplementation] class is responsible
/// for getting the products from the server.

abstract class ProductSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> searchProduct(String query);
}

class ProductSourceImplementation implements ProductSource {
  const ProductSourceImplementation(
    this._dio,
  );
  final Dio _dio;
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(AppUrls.baseUrl + AppUrls.allProducts);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data as List<dynamic>;
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception("Failed to get products list");
      }
    } on ServerFailure {
      rethrow;
    } catch (e, str) {
      throw ServerFailure(e.toString(), str);
    }
  }

  @override
  Future<List<ProductModel>> searchProduct(String query) async {
    try {
      final response =
          await _dio.get(AppUrls.baseUrl + AppUrls.searchProduct + query);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data as List<dynamic>;
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception("Failed to search products from product list");
      }
    } on ServerFailure {
      rethrow;
    } catch (e, str) {
      throw ServerFailure(e.toString(), str);
    }
  }
}
