part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}


class GetProducts extends ProductsEvent {
  
  GetProducts();
}
