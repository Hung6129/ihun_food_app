import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_food_app/src/features/products/domain/entities/product.dart';

import 'package:meta/meta.dart';

import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/search_product_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

/// The [ProductsBloc] is responsible for managing the state of the products.

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required GetProductsUsecase getProductsUsecase,
    required SearchProductUseCase searchProductUseCase,
  })  : _getProductsUsecase = getProductsUsecase,
        _searchProductUseCase = searchProductUseCase,
        super(ProductInitalState()) {
    on<GetProducts>(onGetProducts);
    on<SearchingProduct>(onSearchingProduct);
  }

  final GetProductsUsecase _getProductsUsecase;
  final SearchProductUseCase _searchProductUseCase;

  /// This method is called when the [GetProducts] event is added to the bloc.
  /// This event is added to the bloc when the products are requested.
  /// The bloc will then emit a [ProductsLoading] state.
  /// If the products are successfully retrieved, the bloc will emit a [ProductsLoaded] state.
  /// If the products are not successfully retrieved, the bloc will emit a [ProductsError] state.

  void onGetProducts(ProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await _getProductsUsecase();
      products.fold(
        (l) => emit(ProductsError(message: l.errorMessage)),
        (r) {
          r.isEmpty
              ? emit(ProductsLoadedEmtyList())
              : emit(ProductsLoaded(products: r));
        },
      );
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }

  /// This method is called when the [SearchingProduct] event is added to the bloc.
  /// This event is added to the bloc when the products are requested.
  /// The bloc will then emit a [SearchProductLoading] state.
  /// If the products are successfully retrieved, the bloc will emit a [SearchProductSuccess] state.
  /// If the products are not successfully retrieved, the bloc will emit a [SearchProductError] state.
  /// If the products are empty, the bloc will emit a [SearchProductEmptyList] state.

  void onSearchingProduct(
      ProductsEvent event, Emitter<ProductsState> emit) async {
    event as SearchingProduct;
    final text = event.query;
    if (text.isEmpty) return emit(SearchProductEmptyList());
    emit(SearchProductLoading());
    try {
      final listResults = await _searchProductUseCase(text);
      listResults.fold(
        (l) => emit(SearchProductError(message: l.errorMessage)),
        (r) {
          r.isEmpty
              ? emit(SearchProductEmptyList())
              : emit(SearchProductSuccess(products: r));
        },
      );
    } catch (e) {
      emit(state is SearchProductError
          ? SearchProductError(message: e.toString())
          : const SearchProductError(message: 'Something went wrong'));
    }
  }
}
