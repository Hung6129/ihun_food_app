// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      rating: (json['rating'] as num).toDouble(),
      loved: json['loved'] as int,
      price: json['price'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
      'loved': instance.loved,
      'price': instance.price,
      'description': instance.description,
    };
