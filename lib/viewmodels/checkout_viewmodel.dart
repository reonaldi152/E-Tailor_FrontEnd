import 'package:flutter/material.dart';
import '../services/checkout_service.dart';
import '../models/checkout.dart';

class CheckoutViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<CheckoutModel> _checkoutList = [];
  CheckoutModel _checkoutData = CheckoutModel();

  List<CheckoutModel> get checkoutList => _checkoutList;
  CheckoutModel get checkoutData => _checkoutData;

  void updateUserId(int value) {
    _checkoutData.userId = value;
    notifyListeners();
  }

  void updateProductId(int value) {
    _checkoutData.productId = value;
    notifyListeners();
  }

  void updateInput(int value) {
    _checkoutData.input = value;
    notifyListeners();
  }

  void updateProvince(String value) {
    _checkoutData.province = value;
    notifyListeners();
  }

  void updateCity(String value) {
    _checkoutData.city = value;
    notifyListeners();
  }

  void updateDistrict(String value) {
    _checkoutData.district = value;
    notifyListeners();
  }

  void updatePostalCode(String value) {
    _checkoutData.postalCode = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    _checkoutData.address = value;
    notifyListeners();
  }

  void updateTotalPrice(int value) {
    _checkoutData.totalPrice = value;
    notifyListeners();
  }

  // Fetch data dari API
  Future<void> fetchCheckoutData(int userId) async {
    try {
      _checkoutList = await _apiService.fetchCheckout(userId);
      notifyListeners();
    } catch (e) {
      print("Error fetching checkout data: $e");
    }
  }

  // Kirim data ke API
  Future<bool> submitCheckout() async {
    try {
      bool success = await _apiService.submitCheckout(_checkoutData);
      return success;
    } catch (e) {
      print("Error submitting checkout: $e");
      return false;
    }
  }
}
