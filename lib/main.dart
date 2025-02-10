import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/welcome_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'E-Tailor',
      home: WelcomePage(),
    );
  }
}
// bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Keranjang',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat), // Ikon chat
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue, // Warna untuk item yang dipilih
//         unselectedItemColor: Colors
//             .grey, // Warna untuk item yang tidak dipilih (misalnya abu-abu)
//         onTap: _onItemTapped,
//       ),