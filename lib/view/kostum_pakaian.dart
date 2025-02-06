import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/view/Payment_screen.dart';

class KostumPakaian extends StatefulWidget {
  const KostumPakaian({Key? key}) : super(key: key);

  @override
  State<KostumPakaian> createState() => _KostumPakaianState();
}

class _KostumPakaianState extends State<KostumPakaian> {
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
              Center(
                child: Image.asset(
                  'assets/Katun.jpeg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
              //lingkar dada
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar dada',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung lingkar dada, dengan cara melakukan penarikan parameter dari ujung kiri dada ke ujung kanan dada',
                style: TextStyle(fontSize: 12),
              ),
              //panjang muka
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Panjang Muka',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Panjang Muka, dengan cara melakukan penarikan parameter dari bawah leher sampai ke bawah perut lalu dihitung',
                style: TextStyle(fontSize: 12),
              ),
              //lebar muka
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lebar Muka',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lebar Muka, dengan cara melakukan penarikan parameter dari ketiak sampai ketemu ketiak kembali',
                style: TextStyle(fontSize: 12),
              ),
              //Lebar Bahu
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lebar Bahu',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lebar Bahu, dengan cara melakukan penarikan parameter dari leher hingga kebahu',
                style: TextStyle(fontSize: 12),
              ),
              //Panjang Bahu
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Panjang Bahu',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Panjang Bahu, dengan cara melakukan penarikan parameter dari samping leher sampai ujung perut',
                style: TextStyle(fontSize: 12),
              ),
              //Lingkar Pinggang
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar Pinggang',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lingkar Pinggang, dengan cara melakukan penarikan parameter dengan cara melingkari pinggang ketemu pinggang',
                style: TextStyle(fontSize: 12),
              ),
              //Lingkar Pinggul
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar Pinggul',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lingkar Pinggul, dengan cara melakukan penarikan parameter dari leher hingga kebahu',
                style: TextStyle(fontSize: 12),
              ),
              //Lingkar Ketiak
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar ketiak',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lingkar Ketiak, dengan cara melakukan penarikan parameter dari leher hingga kebahu',
                style: TextStyle(fontSize: 12),
              ),
              //Lingkar Lengan
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar Lengan',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lingkar Lengan, dengan cara melakukan penarikan parameter dari leher hingga kebahu',
                style: TextStyle(fontSize: 12),
              ),
              //Lingkar Tangan
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Lingkar Tangan',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Note : Cara menghitung Lingkar Tangan, dengan cara melakukan penarikan parameter dari leher hingga kebahu',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman home
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentScreen()),
                  );
                },
                // ... (style tombol)
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 165),
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
