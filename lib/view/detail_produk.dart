import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/KostumProduk.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Tailor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Katun.jpeg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bahan Katun',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // ... (Informasi produk lainnya)
                  Row(
                    children: [
                      const Text('Tersedia Warna:'),
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Stock: 100'),
                  const SizedBox(height: 8),
                  const Text('RP: 100.000/Meter'),
                  const SizedBox(height: 16),
                  const Text(
                      'Kain katun adalah jenis kain yang berasal dari serat kapas, serat alami yang diperoleh dari tanaman kapas. Sejak ribuan tahun lalu, katun telah menjadi bahan tekstil yang sangat populer karena berbagai keunggulannya.'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const KostumProduk(), // Navigasi ke KostumProduk
                    ),
                  );
                },
                child: const Text('Lakukan Pembayaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
