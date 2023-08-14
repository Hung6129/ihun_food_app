// ignore_for_file: public_member_api_docs, sort_constructors_first
//  {
//         "_id": "64c4f5209e2a4167ce242a86",
//         "name": "Tiramisu",
//         "title": "Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese.",
//         "category": "Desserts",
//         "image": [
//             "https://images.unsplash.com/photo-1631206753348-db44968fd440?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8VGlyYW1pc3V8ZW58MHwwfDB8fHww&auto=format&fit=crop&w=800&q=60",
//             "https://images.unsplash.com/photo-1628441762468-f98cd323be61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8VGlyYW1pc3V8ZW58MHwwfDB8fHww&auto=format&fit=crop&w=800&q=60"
//         ],
//         "rating": 4.9,
//         "loved": 3821,
//         "price": "$10",
//         "description": "Tiramisu is a popular Italian dessert made with layers of coffee-soaked ladyfingers and a creamy mascarpone cheese mixture, dusted with cocoa powder.",
//         "createdAt": "2023-07-29T11:16:48.341Z",
//         "updatedAt": "2023-07-29T11:16:48.341Z",
//         "__v": 0
//     }

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final String title;
  final String category;
  final List<String> image;
  final double rating;
  final int loved;
  final String price;
  final String description;
  ProductModel({
    required this.id,
    required this.name,
    required this.title,
    required this.category,
    required this.image,
    required this.rating,
    required this.loved,
    required this.price,
    required this.description,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
