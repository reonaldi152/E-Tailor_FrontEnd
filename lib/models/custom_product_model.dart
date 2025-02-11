import 'package:json_annotation/json_annotation.dart';

part 'custom_product.g.dart'; // Pastikan baris ini ada!

@JsonSerializable()
class CustomProduct {
  CustomProduct({
    this.id,
    this.productId,
    this.name,
    this.lingkarDada,
    this.panjangMuka,
    this.lebarMuka,
    this.lebarBahu,
    this.lingkarPinggang,
    this.lingkarPinggul,
    this.lingkarKetiak,
    this.lingkarTangan,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  // Konversi dari JSON ke CustomProduct
  factory CustomProduct.fromJson(Map<String, dynamic> json) =>
      _$CustomProductFromJson(json);

  // Konversi dari CustomProduct ke JSON
  Map<String, dynamic> toJson() => _$CustomProductToJson(this);

  final dynamic id;
  @JsonKey(name: 'product_id')
  final dynamic productId;
  final String? name;
  @JsonKey(name: 'lingkar_dada')
  final dynamic lingkarDada;
  @JsonKey(name: 'panjang_muka')
  final dynamic panjangMuka;
  @JsonKey(name: 'lebar_muka')
  final dynamic lebarMuka;
  @JsonKey(name: 'lebar_bahu')
  final dynamic lebarBahu;
  @JsonKey(name: 'lingkar_pinggang')
  final dynamic lingkarPinggang;
  @JsonKey(name: 'lingkar_pinggul')
  final dynamic lingkarPinggul;
  @JsonKey(name: 'lingkar_ketiak')
  final dynamic lingkarKetiak;
  @JsonKey(name: 'lingkar_tangan')
  final dynamic lingkarTangan;
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;
  final dynamic product;
}
