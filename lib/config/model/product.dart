import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.stock,
      this.price,
      this.created_at});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  final dynamic id;
  final dynamic name;
  final dynamic image;
  final dynamic description;
  final dynamic stock;
  final dynamic price;
  final dynamic created_at;

  @override
  String toString() => json.encode(this);
}
