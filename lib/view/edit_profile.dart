import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controller untuk menyimpan nilai input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: SingleChildScrollView(
        // Untuk mencegah overflow jika konten terlalu panjang
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas (avatar dan tombol ganti foto)
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/image.jpg'), // Ganti dengan path gambar Anda
                  ),
                  TextButton(
                    onPressed: () {
                      // Logika untuk mengganti foto profil
                    },
                    child: const Text('Ganti Foto'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Form input
            _buildTextField('Nama', _namaController),
            _buildTextField('Email', _emailController),
            _buildTextField('Nomor Handphone', _noTelpController),

            const SizedBox(height: 32),

            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk menyimpan perubahan profil
                  String nama = _namaController.text;
                  String email = _emailController.text;
                  String noTelp = _noTelpController.text;

                  // Lakukan validasi data jika diperlukan sebelum menyimpan
                  if (nama.isNotEmpty &&
                      email.isNotEmpty &&
                      noTelp.isNotEmpty) {
                    // Panggil fungsi untuk menyimpan data ke database atau API
                    _simpanData(nama, email, noTelp);
                  } else {
                    // Tampilkan pesan kesalahan jika input tidak valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Input tidak valid!')),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat TextField dengan label
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menyimpan data ke database atau API
  void _simpanData(String nama, String email, String noTelp) {
    // Implementasikan logika penyimpanan data di sini
    // Misalnya, menggunakan Firebase, API, atau lainnya
    print('Nama: $nama, Email: $email, No. Telp: $noTelp');
  }
}
