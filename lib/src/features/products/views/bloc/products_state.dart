part of 'products_bloc.dart';

@immutable
sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

/// This state is emitted when the products are requested.
/// The bloc will then emit a [ProductsLoading] state.
/// If the products are successfully retrieved, the bloc will emit a [ProductsLoaded] state.
/// If the products are not successfully retrieved, the bloc will emit a [ProductsError] state.
/// If the products are empty, the bloc will emit a [ProductsLoadedEmtyList] state.

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

/// This state is emitted when the user is searching for a product.
/// The bloc will emit a [SearchProductLoading] state.
/// If the products are successfully retrieved,
/// the bloc will emit a [SearchProductSuccess] state.
/// If the products are not successfully retrieved,
/// the bloc will emit a [SearchProductError] state.
/// If the products are empty, the bloc will emit a [SearchProductEmptyList] state.

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
