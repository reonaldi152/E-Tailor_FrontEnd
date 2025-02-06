import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/chat_page.dart';
import 'package:flutter_application_1/view/detail_produk.dart';
import 'package:flutter_application_1/view/profile.dart';
import 'package:flutter_application_1/view/riwayat_pemesanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Indeks halaman yang aktif

  // Daftar widget untuk setiap halaman bottom navigation
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // Widget untuk halaman Home
    const RiwayatPembelianScreen(),
    ChatPage(),
    const ProfilePage(), // Widget untuk halaman Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E - Tailor'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex], // Tampilkan widget sesuai indeks
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Ikon chat
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Warna untuk item yang dipilih
        unselectedItemColor: Colors
            .grey, // Warna untuk item yang tidak dipilih (misalnya abu-abu)
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget untuk halaman Home (diekstrak untuk kerapian kode)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        BahanBajuCard(
          gambar: 'assets/Katun.jpeg',
          namaBahan: 'Bahan Katun',
        ),
        BahanBajuCard(
          gambar: 'assets/Pollyster.jpeg',
          namaBahan: 'Bahan Polyester',
        ),
        BahanBajuCard(
          gambar: 'assets/Sutra.jpg',
          namaBahan: 'Bahan Sutra',
        ),
      ],
    );
  }
}

class BahanBajuCard extends StatelessWidget {
  final String gambar;
  final String namaBahan;

  const BahanBajuCard(
      {super.key, required this.gambar, required this.namaBahan});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(gambar),
        title: Text(namaBahan),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailProduk(),
              ),
            );
          },
          child: const Text('Cek Detail'),
        ),
      ),
    );
  }
}
