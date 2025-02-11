import 'package:dio/dio.dart';
import '../models/checkout.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<CheckoutModel>> fetchCheckout(int userId) async {
    try {
      final response =
          await _dio.get('https://etaylor-admin.my.id/api/checkout/$userId');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => CheckoutModel.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load checkout data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<bool> submitCheckout(CheckoutModel checkoutData) async {
    try {
      final response = await _dio.post(
        'https://etaylor-admin.my.id/api/checkout',
        data: checkoutData.toJson(),
      );
      return response.statusCode == 201;
    } catch (e) {
      throw Exception("Failed to submit checkout: $e");
    }
  }
}
