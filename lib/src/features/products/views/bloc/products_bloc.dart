import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_food_app/src/features/products/domain/entities/product.dart';

import 'package:meta/meta.dart';

import '../../domain/usecases/get_products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required GetProductsUsecase getProductsUsecase,
  })  : _getProductsUsecase = getProductsUsecase,
        super(
          const ProductsInitial(),
        ) {
    on<GetProducts>(onGetProducts);
  }

  final GetProductsUsecase _getProductsUsecase;

  /// This method is called when the [GetProducts] event is added to the bloc.
  /// This event is added to the bloc when the products are requested.
  /// The bloc will then emit a [ProductsLoading] state.
  /// If the products are successfully retrieved, the bloc will emit a [ProductsLoaded] state.
  /// If the products are not successfully retrieved, the bloc will emit a [ProductsError] state.

  void onGetProducts(ProductsEvent event, Emitter<ProductsState> emit) async {
    emit(const ProductsLoading());
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
}
