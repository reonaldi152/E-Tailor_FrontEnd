import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/custom_product_model.dart';
import '../services/custom_product_service.dart';

class CustomProductViewModel extends ChangeNotifier {
  final CustomProductService _service = CustomProductService();
  List<CustomProduct> _customProducts = [];
  bool _isLoading = false;

  List<CustomProduct> get customProducts => _customProducts;
  bool get isLoading => _isLoading;

  Future<void> fetchCustomProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _customProducts = await _service.fetchCustomProducts();
    } catch (e) {
      _customProducts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
