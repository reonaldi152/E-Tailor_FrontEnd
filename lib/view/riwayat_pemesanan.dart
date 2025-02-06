import 'package:flutter/material.dart';

class RiwayatPembelianScreen extends StatelessWidget {
  const RiwayatPembelianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // Menggunakan ListView untuk scroll jika item terlalu panjang
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOrderItem(
            image: 'assets/Pollyster.jpeg', // Ganti dengan path gambar Anda
            title: 'Bahan Katun',
            price: 'RP 150.000',
            status: 'Setuju',
          ),
          _buildOrderItem(
            image: 'assets/Katun.jpeg', // Ganti dengan path gambar Anda
            title: 'Bahan Katun',
            price: 'RP 150.000',
            status: 'Menunggu',
          ),
          _buildOrderItem(
            image: 'assets/Sutra.jpg', // Ganti dengan path gambar Anda
            title: 'Bahan Katun',
            price: 'RP 150.000',
            status: 'Ditolak',
          ),
          // Tambahkan item lain di sini sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String image,
    required String title,
    required String price,
    required String status,
  }) {
    return Card(
      // Menggunakan Card untuk tampilan per item
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(price),
                  const SizedBox(height: 8),
                  Text(status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
