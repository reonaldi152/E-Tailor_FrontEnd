import 'package:flutter_application_1/models/checkout.dart';

class TransactionModel {
  int? id;
  int? user_id;
  int? checkout_id;
  String? total_price;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  CheckoutModel? checkout;

  TransactionModel({
    this.id,
    this.user_id,
    this.checkout_id,
    this.total_price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.checkout
  });

  // Konversi dari JSON (untuk mendapatkan data dari API)
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      user_id: json['user_id'],
      checkout_id: json['checkout_id'],
      total_price: json['total_price'],
      status: json['status'],
      checkout: json['checkout'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }

  // Konversi ke JSON (untuk mengirim data ke API)
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'checkout_id': checkout_id,
      'total_price': total_price,
      'status': status,
      'checkout': checkout
    };
  }
}
