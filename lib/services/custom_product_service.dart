import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/custom_product_model.dart';

class KostumProdukService {
  final Dio _dio = Dio();
  final String apiUrl = "https://your-backend.com/api/kostum";

  Future<void> submitKostumProduk(KostumProdukModel kostumProduk) async {
    try {
      Response response = await _dio.post(apiUrl, data: kostumProduk.toJson());

      if (response.statusCode == 200) {
        print("Data berhasil dikirim!");
      } else {
        print("Gagal mengirim data.");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
