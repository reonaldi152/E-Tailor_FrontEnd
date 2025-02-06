import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login_Page.dart';

class LupaPasswordPage extends StatelessWidget {
  const LupaPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lupa Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Masukkan alamat email Anda',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk mengirim email reset password di sini
                // Contoh: Menggunakan Firebase Authentication
                // FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
