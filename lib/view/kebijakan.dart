import 'package:flutter/material.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privasi'),
      ),
      body: SingleChildScrollView(
        // Untuk memastikan teks dapat di-scroll jika panjang
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          """
          **Kebijakan Privasi**
          Kami menghargai privasi Anda. Dokumen ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda.

          **Informasi yang Kami Kumpulkan**
          Kami dapat mengumpulkan informasi berikut:

          * Informasi pribadi yang Anda berikan saat mendaftar atau menggunakan layanan kami, seperti nama, alamat email, nomor telepon.
          * Informasi tentang bagaimana Anda menggunakan layanan kami, seperti halaman yang Anda kunjungi, fitur yang Anda gunakan.
          * Informasi perangkat, seperti jenis perangkat, sistem operasi.

          **Bagaimana Kami Menggunakan Informasi Anda**
          Kami dapat menggunakan informasi Anda untuk:

          * Menyediakan dan meningkatkan layanan kami.
          * Menghubungi Anda dengan informasi terkait layanan.
          * Mempersonalisasi pengalaman Anda.

          **Keamanan Informasi Anda**
          Kami mengambil langkah-langkah keamanan yang wajar untuk melindungi informasi Anda dari akses yang tidak sah.

          **Perubahan Kebijakan Privasi**
          Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Perubahan akan diposting di halaman ini.

          **Hubungi Kami**
          Jika Anda memiliki pertanyaan tentang kebijakan privasi ini, silakan hubungi kami di [alamat email Anda].

          Terima kasih telah menggunakan layanan kami!
          """, // Ganti dengan teks kebijakan privasi Anda yang sebenarnya
          style: TextStyle(fontSize: 16), // Styling teks (opsional)
        ),
      ),
    );
  }
}
