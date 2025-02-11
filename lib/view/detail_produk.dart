import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/checkout.dart';
import '../models/product_model.dart';

class DetailPage extends StatelessWidget {
  final ProductModel product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Tailor"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk (diposisikan di tengah)
            Center(
              // Widget Center untuk memposisikan gambar di tengah
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  width: double
                      .infinity, // Atau atur lebar spesifik jika diperlukan
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 200),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama Produk
            Center(
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Warna Produk
            const Text("Tersedia Warna",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCircle(Colors.red),
                _buildColorCircle(Colors.black),
                _buildColorCircle(Colors.blue),
                _buildColorCircle(Colors.grey),
              ],
            ),
            const SizedBox(height: 16),

            // Stok Produk
            Text("Stock: ${product.stock}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            // Harga Produk
            Text("RP : ${product.price}/Meter",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Deskripsi Produk
            Text(product.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
          ],
        ),
      ),

      // Tombol Pembayaran
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            // Konversi input menjadi angka, default ke 1 jika kosong atau tidak valid
            int inputJumlah = int.tryParse(inputController.text) ?? 1;

            // Simulasi user ID (gantilah dengan user ID yang benar dari backend/authentication)
            int userId = 1; // Ubah sesuai dengan sistem login

            // Navigasi ke CheckoutScreen dengan parameter yang benar
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                  product: product,
                  input: inputJumlah,
                  userId: userId,
                ),
              ),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 8),
              Text("Lakukan Pembayaran", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
