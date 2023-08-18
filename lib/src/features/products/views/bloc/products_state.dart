part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;

  const ProductsLoaded({
    required this.products,
  });
}

final class ProductsLoadedEmtyList extends ProductsState {
  ProductsLoadedEmtyList();
  final List<ProductEntity> products = [];
}

final class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message});
}
