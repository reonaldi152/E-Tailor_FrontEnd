import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/view/Payment_screen.dart';
import 'package:flutter_application_1/view/kostum_pakaian.dart';

class KostumProduk extends StatefulWidget {
  const KostumProduk({Key? key}) : super(key: key);

  @override
  State<KostumProduk> createState() => _KostumProdukState();
}

class _KostumProdukState extends State<KostumProduk> {
  final _formKey = GlobalKey<FormState>(); // Key untuk Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E - Tailor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Key untuk Form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Kostum Pakaian',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/Katun.jpeg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Bahan Kain',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // ... (TextFormField lainnya)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Input',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Provinsi',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kota',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kecamatan',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kode Pos',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alamat Lengkap',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validasi berhasil, tampilkan alert
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text(
                              'Apakah Anda ingin Kostumisasi Pakaian?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Tutup dialog
                                // Navigasi ke halaman selanjutnya
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentScreen(),
                                  ),
                                );
                              },
                              child: const Text('Tidak'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Tutup dialog
                                // Navigasi ke halaman selanjutnya
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KostumPakaian(),
                                  ),
                                );
                              },
                              child: const Text('Ya'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                // ... (style tombol)
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 170),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Lanjut',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
