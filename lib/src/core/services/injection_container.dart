import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ihun_food_app/src/features/products/data/data_src/product_remote_datasource.dart';
import 'package:ihun_food_app/src/features/products/data/repositories/product_repository_implementation.dart';
import 'package:ihun_food_app/src/features/products/views/bloc/products_bloc.dart';

import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/get_products_usecase.dart';
import '../../features/products/domain/usecases/search_product_usecase.dart';

/// sl is the service locator
/// It is used to register the dependencies
final sl = GetIt.instance;

/// init is used to register the dependencies
/// It is called in the main.dart file
Future<void> init() async {
  ///Blocs live in the presentation layer
  sl.registerFactory<ProductsBloc>(() => ProductsBloc(
        getProductsUsecase: sl(),
        searchProductUseCase: sl(),
      ));

  // Usecases live in the domain layer
  sl.registerLazySingleton<GetProductsUsecase>(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton<SearchProductUseCase>(
      () => SearchProductUseCase(sl()));

  // Repositories live in the data layer
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplementation(sl()));

  // Data sources live in the data layer
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImplementation(sl()));

  // External dependencies
  sl.registerLazySingleton(() => Dio());
}
