class ProductModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final int price;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'], // Sesuaikan dengan key JSON
      description: json['description'],
      price: int.parse(json['price']), // Ubah string menjadi int
      stock: int.parse(json['stock']), // Ubah string menjadi int
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
