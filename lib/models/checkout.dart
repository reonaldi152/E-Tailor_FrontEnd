class CheckoutModel {
  int? id;
  int? userId;
  int? productId;
  int? input;
  String? province;
  String? city;
  String? district;
  String? postalCode;
  String? address;
  int? totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  CheckoutModel({
    this.id,
    this.userId,
    this.productId,
    this.input,
    this.province,
    this.city,
    this.district,
    this.postalCode,
    this.address,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  // Konversi dari JSON (untuk mendapatkan data dari API)
  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      input: json['input'],
      province: json['provinsi'],
      city: json['kota'],
      district: json['kecamatan'],
      postalCode: json['kode_pos'],
      address: json['address'],
      totalPrice: json['total_price'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }

  // Konversi ke JSON (untuk mengirim data ke API)
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'input': input,
      'provinsi': province,
      'kota': city,
      'kecamatan': district,
      'kode_pos': postalCode,
      'address': address,
      'total_price': totalPrice,
    };
  }
}
