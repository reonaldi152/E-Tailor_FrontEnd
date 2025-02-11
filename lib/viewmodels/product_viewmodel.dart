import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://etaylor-admin.my.id/api/",
      connectTimeout: 10000, // 10 detik dalam milidetik
      receiveTimeout: 10000, // 10 detik dalam milidetik
    ),
  );

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dio.get("/products"); // Sesuaikan endpoint
      if (kDebugMode) {
        print("Response Data: ${response.data}");
      }

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> productList = response.data['data'];
        _products =
            productList.map((json) => ProductModel.fromJson(json)).toList();
        if (kDebugMode) {
          print("Products fetched: ${_products.length} items");
        }
      } else {
        if (kDebugMode) {
          print("Failed to fetch products: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching products: $e");
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
