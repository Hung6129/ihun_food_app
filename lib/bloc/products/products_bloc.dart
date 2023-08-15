import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import '../../models/product_model.dart';
import '../../repo/services/products_services.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});

    on<GetProducts>(
      (event, emit) async {
        emit(ProductsLoading());
        try {
          final products = await ProductsRepoImpl().getProducts();
          if (products.isEmpty) {
            emit(ProductsLoadedEmtyList());
          } else {
            emit(ProductsLoaded(products));
          }
          emit(ProductsLoaded(products));
        } catch (e) {
          emit(ProductsError(e.toString()));
        }
      },
    );
  }
}
