class CheckoutModel {
  int? id;
  int? user_id;
  int? product_id;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kode_pos;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  CheckoutModel({
    this.id,
    this.user_id,
    this.product_id,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.kode_pos,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  // Konversi dari JSON (untuk mendapatkan data dari API)
  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'],
      user_id: json['user_id'],
      product_id: json['product_id'],
      provinsi: json['provinsi'],
      kota: json['kota'],
      kecamatan: json['kecamatan'],
      kode_pos: json['kode_pos'],
      address: json['address'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }

  // Konversi ke JSON (untuk mengirim data ke API)
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'product_id': product_id,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kode_pos': kode_pos,
      'address': address,
    };
  }
}
