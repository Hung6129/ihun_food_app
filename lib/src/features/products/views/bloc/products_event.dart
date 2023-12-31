part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductsEvent {
  const GetProducts();

  @override
  List<Object> get props => [];
}

class SearchingProduct extends ProductsEvent {
  final String query;

  const SearchingProduct({required this.query});
}
