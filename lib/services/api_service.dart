import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ApiService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://etaylor-admin.my.id/api/products'));

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get('/products');
      print("API Response: ${response.data}"); // Debugging log

      if (response.statusCode == 200) {
        List data = response.data['data']; // Sesuaikan dengan struktur JSON
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
