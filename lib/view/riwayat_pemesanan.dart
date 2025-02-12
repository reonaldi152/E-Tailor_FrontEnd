import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/payment_viewmodel.dart';
import 'package:intl/intl.dart'; // Untuk format harga ke Rupiah

class RiwayatPembelianScreen extends StatefulWidget {
  const RiwayatPembelianScreen({Key? key}) : super(key: key);

  @override
  _RiwayatPembelianScreenState createState() => _RiwayatPembelianScreenState();
}

class _RiwayatPembelianScreenState extends State<RiwayatPembelianScreen> {
  late Future<List<dynamic>> _futureTransactions;

  @override
  void initState() {
    super.initState();
    _futureTransactions = getHistoryTransaction();
  }

  Future<List<dynamic>> getHistoryTransaction() async {
    try {
      final response = await PaymentViewmodel().history();
      if (response.success && response.message == "Transaction history retrieved successfully") {
        return response.data; // Mengembalikan daftar transaksi
      } else {
        throw Exception("Gagal mengambil riwayat transaksi.");
      }
    } catch (e) {
      debugPrint("Error fetching history: $e");
      throw Exception("Terjadi kesalahan saat mengambil riwayat transaksi.");
    }
  }

  String formatCurrency(String price) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(double.tryParse(price) ?? 0);
  }

  String translateStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Menunggu';
      case 'completed':
        return 'Selesai';
      case 'failed':
        return 'Gagal';
      case 'canceled':
        return 'Dibatalkan';
      default:
        return 'Tidak Diketahui';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Pembelian")),
      body: FutureBuilder<List<dynamic>>(
        future: _futureTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red)),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Tidak ada transaksi ditemukan"),
            );
          } else {
            List transactions = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                var checkout = transaction['checkout']; // Ambil data checkout

                return _buildOrderItem(
                  id: transaction['id'].toString(),
                  title: "Produk ID: ${checkout['product_id']}",
                  quantity: checkout['quantity'].toString(),
                  price: formatCurrency(transaction['total_price']),
                  status: translateStatus(transaction['status']),
                  address: "${checkout['kecamatan']}, ${checkout['kota']}, ${checkout['provinsi']}",
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildOrderItem({
    required String id,
    required String title,
    required String quantity,
    required String price,
    required String status,
    required String address,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text("Jumlah: $quantity Meter"),
            Text("Total Harga: $price"),
            Text("Alamat: $address"),
            const SizedBox(height: 8),
            Text(
              "Status: $status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _getStatusColor(status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'menunggu':
        return Colors.orange;
      case 'selesai':
        return Colors.green;
      case 'gagal':
        return Colors.red;
      case 'dibatalkan':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}
