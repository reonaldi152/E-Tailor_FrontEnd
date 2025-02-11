import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/custom_product_model.dart';

class CustomProductService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: 'https://etaylor-admin.my.id/api/costume-products'));

  Future<List<CustomProduct>> fetchCustomProducts() async {
    try {
      final response = await _dio.get('/custom-products');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => CustomProduct.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load custom products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
