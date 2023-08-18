import 'package:equatable/equatable.dart';

/// This ProductEntity class is used to define a product entity
/// It extends the [Equatable] class from the equatable package
/// It is used to compare objects for equality

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String title;
  final String category;
  final List<String> image;
  final double rating;
  final int loved;
  final String price;
  final String description;

  const ProductEntity(
    this.id,
    this.name,
    this.title,
    this.category,
    this.image,
    this.rating,
    this.loved,
    this.price,
    this.description,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        category,
        image,
        rating,
        loved,
        price,
        description,
      ];
}
