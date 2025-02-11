// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      stock: json['stock'],
      price: json['price'],
      created_at: json['created_at'],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'stock': instance.stock,
      'price': instance.price,
      'created_at': instance.created_at,
    };
