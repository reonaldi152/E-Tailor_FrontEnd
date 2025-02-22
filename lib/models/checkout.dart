class CheckoutModel {
  int? id;
  int? userId;
  int? productId;
  String? province;
  String? city;
  String? district;
  String? postalCode;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  CheckoutModel({
    this.id,
    this.userId,
    this.productId,
    this.province,
    this.city,
    this.district,
    this.postalCode,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  // Konversi dari JSON (untuk mendapatkan data dari API)
  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      province: json['provinsi'],
      city: json['kota'],
      district: json['kecamatan'],
      postalCode: json['kode_pos'],
      address: json['address'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }

  // Konversi ke JSON (untuk mengirim data ke API)
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'provinsi': province,
      'kota': city,
      'kecamatan': district,
      'kode_pos': postalCode,
      'address': address,
    };
  }
}
