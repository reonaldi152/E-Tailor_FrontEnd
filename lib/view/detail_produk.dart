import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/view/KostumProduk.dart';
import '../models/product_model.dart';
import 'checkout.dart';

class DetailPage extends StatelessWidget {
  final ProductModel product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Tailor"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 200),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text("Stock: ${product.stock}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("RP : ${product.price}/Meter",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(product.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Apakah anda ingin membeli"),
                  content: TextField(
                    controller: inputController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        hintText: "Masukkan jumlah meter"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        int inputJumlah =
                            int.tryParse(inputController.text) ?? 1;
                        int totalHarga = inputJumlah * product.price;
                        Navigator.pop(context);

                        if (inputJumlah >= 10){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomProductView(
                                qty: inputJumlah,
                                product: ProductModel(
                                  id: product.id,
                                  name: product.name,
                                  image: product.image,
                                  price: totalHarga,
                                  stock: product.stock,
                                  description: '',
                                  createdAt: DateTime.now(),
                                  updatedAt: DateTime.now(),
                                ),
                              ),
                            ),
                          );
                        } else if (inputJumlah < 10){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(product: product, qty: inputJumlah,),
                            ),
                          );
                        }

                      },
                      child: const Text("Lanjutkan"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 8),
              Text("Lanjutkan Pembelian", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
