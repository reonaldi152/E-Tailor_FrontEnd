import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/endpoint.dart';
import 'package:flutter_application_1/config/model/product.dart';
import 'package:flutter_application_1/config/network.dart';

class DetailProduk extends StatefulWidget {
  final int productId;

  const DetailProduk({Key? key, required this.productId}) : super(key: key);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  Product? product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    var response =
        await Network.getApi("${Endpoint.productUrl}/${widget.productId}");
    setState(() {
      product = Product.fromJson(response['data']);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Tailor"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Produk
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product!.image,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Nama Produk
                    Text(
                      product!.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),

                    // Pilihan Warna
                    const Text("Tersedia Warna"),
                    Row(
                      children: [
                        _colorCircle(Colors.black),
                        _colorCircle(Colors.red),
                        _colorCircle(Colors.blue),
                        _colorCircle(Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Stock & Harga
                    Text("Stock: ${product!.stock}",
                        style: const TextStyle(fontSize: 16)),
                    Text("Rp ${product!.price}/Meter",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // Deskripsi Produk
                    Text(
                      product!.description,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Implementasi pembayaran
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Lakukan Pembayaran"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _colorCircle(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black)),
    );
  }
}
