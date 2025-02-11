import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/custom_product_model.dart';
import 'package:flutter_application_1/services/custom_product_service.dart';

class KostumProdukViewModel extends ChangeNotifier {
  final KostumProdukService _apiService = KostumProdukService();

  final TextEditingController lingkarDadaController = TextEditingController();
  final TextEditingController panjangMukaController = TextEditingController();
  final TextEditingController lebarMukaController = TextEditingController();
  final TextEditingController lebarBahuController = TextEditingController();
  final TextEditingController lingkarPinggangController =
      TextEditingController();
  final TextEditingController lingkarPinggulController =
      TextEditingController();
  final TextEditingController lingkarKetiakController = TextEditingController();
  final TextEditingController lingkarTanganController = TextEditingController();

  Future<void> submitData(BuildContext context) async {
    KostumProdukModel kostumProduk = KostumProdukModel(
      lingkarDada: lingkarDadaController.text,
      panjangMuka: panjangMukaController.text,
      lebarMuka: lebarMukaController.text,
      lebarBahu: lebarBahuController.text,
      lingkarPinggang: lingkarPinggangController.text,
      lingkarPinggul: lingkarPinggulController.text,
      lingkarKetiak: lingkarKetiakController.text,
      lingkarTangan: lingkarTanganController.text,
    );

    await _apiService.submitKostumProduk(kostumProduk);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data berhasil dikirim!")),
    );
  }
}
