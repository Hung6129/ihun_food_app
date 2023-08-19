part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

/// Get Products
final class ProductInitalState extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;

  const ProductsLoaded({
    required this.products,
  });
  @override
  String toString() => 'ProductsLoaded(products: $products)';
  @override
  List<Object> get props => [products];
}

final class ProductsLoadedEmtyList extends ProductsState {}

final class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message});
  @override
  String toString() => 'ProductsError(message: $message)';
  @override
  List<Object> get props => [message];
}

/// Search Product
final class SearchProductSuccess extends ProductsState {
  final List<ProductEntity> products;

  const SearchProductSuccess({required this.products});
  @override
  String toString() => 'SearchProductSuccess(products: $products)';
  @override
  List<Object> get props => [products];
}

final class SearchProductLoading extends ProductsState {}

final class SearchProductEmptyList extends ProductsState {}

final class SearchProductError extends ProductsState {
  final String message;

  const SearchProductError({required this.message});
  @override
  String toString() => 'SearchProductError(message: $message)';
  @override
  List<Object> get props => [message];
}

/// Get Product Detail
final class ProductDetailLoading extends ProductsState {}

final class ProductDetailLoaded extends ProductsState {
  final ProductEntity product;

  const ProductDetailLoaded({required this.product});
  @override
  String toString() => 'ProductDetailLoaded(product: $product)';
  @override
  List<Object> get props => [product];
}

final class ProductDetailError extends ProductsState {
  final String message;

  const ProductDetailError({required this.message});
  @override
  String toString() => 'ProductDetailError(message: $message)';
  @override
  List<Object> get props => [message];
}
