import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home_page.dart';
// Import halaman homepage Anda. Ganti 'homepage.dart' dengan nama file homepage Anda

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Tailor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'You Order',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    'assets/setuju.png',
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            _buildDetailRow('Harga Barang', '100.000'),
            _buildDetailRow('Ongkos Kirim', '10.000'),
            _buildDetailRow('Biaya Admin', '5.000'),
            const Divider(),
            _buildDetailRow('Total Biaya', '115.000', isBold: true),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke homepage
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Ganti HomePage() dengan widget homepage Anda
                  (Route<dynamic> route) =>
                      false, // Ini akan menghapus semua route sebelumnya
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
