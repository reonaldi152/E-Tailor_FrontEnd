import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/viewmodels/custom_product_viewmodel.dart';
import 'package:provider/provider.dart';

class KostumProdukScreen extends StatelessWidget {
  const KostumProdukScreen({Key? key, required ProductModel product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<KostumProdukViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("E - Tailor")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Produk
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://via.placeholder.com/350",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 200),
              ),
            ),
            const SizedBox(height: 16),

            // Nama Produk
            const Text("Costum Pakaian",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Input Ukuran
            _buildMeasurementField(
                context, "Lingkar Dada", viewModel.lingkarDadaController),
            _buildMeasurementField(
                context, "Panjang Muka", viewModel.panjangMukaController),
            _buildMeasurementField(
                context, "Lebar Muka", viewModel.lebarMukaController),
            _buildMeasurementField(
                context, "Lebar Bahu", viewModel.lebarBahuController),
            _buildMeasurementField(context, "Lingkar Pinggang",
                viewModel.lingkarPinggangController),
            _buildMeasurementField(
                context, "Lingkar Pinggul", viewModel.lingkarPinggulController),
            _buildMeasurementField(
                context, "Lingkar Ketiak", viewModel.lingkarKetiakController),
            _buildMeasurementField(
                context, "Lingkar Tangan", viewModel.lingkarTanganController),

            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () => viewModel.submitData(context),
          child: const Text("Lanjutkan Pembayaran",
              style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildMeasurementField(
      BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "-",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
