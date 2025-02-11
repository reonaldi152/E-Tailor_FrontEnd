// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomProduct _$CustomProductFromJson(Map<String, dynamic> json) =>
    CustomProduct(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'] as String?,
      lingkarDada: json['lingkar_dada'],
      panjangMuka: json['panjang_muka'],
      lebarMuka: json['lebar_muka'],
      lebarBahu: json['lebar_bahu'],
      lingkarPinggang: json['lingkar_pinggang'],
      lingkarPinggul: json['lingkar_pinggul'],
      lingkarKetiak: json['lingkar_ketiak'],
      lingkarTangan: json['lingkar_tangan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: json['product'],
    );

Map<String, dynamic> _$CustomProductToJson(CustomProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'lingkar_dada': instance.lingkarDada,
      'panjang_muka': instance.panjangMuka,
      'lebar_muka': instance.lebarMuka,
      'lebar_bahu': instance.lebarBahu,
      'lingkar_pinggang': instance.lingkarPinggang,
      'lingkar_pinggul': instance.lingkarPinggul,
      'lingkar_ketiak': instance.lingkarKetiak,
      'lingkar_tangan': instance.lingkarTangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'product': instance.product,
    };
