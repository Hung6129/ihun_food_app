// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as String,
      json['name'] as String,
      json['title'] as String,
      json['category'] as String,
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      (json['rating'] as num).toDouble(),
      json['loved'] as int,
      json['price'] as String,
      json['description'] as String,
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
