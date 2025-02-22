import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/viewmodels/custom_product_viewmodel.dart';
import 'checkout.dart';

class CustomProductView extends StatelessWidget {
  const CustomProductView({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final _controllers = {
      "lingkarDada": TextEditingController(),
      "panjangMuka": TextEditingController(),
      "lebarMuka": TextEditingController(),
      "lebarBahu": TextEditingController(),
      "lingkarPinggang": TextEditingController(),
      "lingkarPinggul": TextEditingController(),
      "lingkarKetiak": TextEditingController(),
      "lingkarTangan": TextEditingController(),
    };

    return Scaffold(
      appBar: AppBar(title: const Text('E - Tailor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
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
                  const SizedBox(height: 10),
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            for (var entry in _controllers.entries)
              _buildMeasurementField(context, entry.key, entry.value),
            Text(
              'Harga: Rp ${product.price}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  handleCustomProduct(context, product, _controllers),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Lanjutkan Pembayaran",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementField(
      BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.blue),
            onPressed: () {
              _showMeasurementInfo(context, label);
            },
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _showMeasurementInfo(BuildContext context, String label) {
    final Map<String, String> _measurementDescriptions = {
      "lebarBahu":
          "Menghitung lebar bahu yaitu ukuran yang diambil dari titik terluar bahu kanan hingga titik terluar bahu kiri. Pengukuran ini penting untuk menentukan proporsi yang tepat pada bagian bahu kebaya, sehingga kebaya terlihat pas dan nyaman saat dikenakan.",
      "lebarMuka":
          "untuk menghitung lebar muka yaitu ukuran yang diambil dari titik tengah dada hingga titik tengah dada yang lain. Pengukuran ini penting untuk memastikan bahwa bahan memiliki proporsi yang pas di bagian depan tubuh.",
      "lingkarDada":
          "untuk menghitung lingkar dada, kamu harus membawa meteran dari ketiak ketemu ketiak hinggu melewati tengah tengah dada manusia",
      "lingkarKetiak":
          "Lingkar ketiak, juga dikenal sebagai lingkar lengan bawah, dengan ukuran yang diambil di sekeliling ketiak. Pengukuran ini penting untuk memastikan bahwa lengan kebaya pas dan nyaman di bagian ketiak, serta tidak terasa sempit atau longgar saat dikenakan.",
      "lingkarPinggang":
          "untuk menghitung lingkar pinggang yaitu ukuran yang diambil di sekeliling pinggang, yaitu pada bagian terkecil dari tubuh antara dada dan pinggul. Pengukuran ini penting untuk memastikan bahwa kebaya pas dan nyaman di bagian pinggang, serta memberikan siluet yang indah saat dikenakan.",
      "lingkarPinggul":
          "untuk menghitung lingkar pinggul yaitu ukuran yang diambil di sekeliling bagian pinggul, yaitu pada bagian terlebar dari tubuh di bawah pinggang. Pengukuran ini penting untuk memastikan bahwa kebaya pas dan nyaman di bagian pinggul, serta memberikan siluet yang indah saat dikenakan..",
      "lingkarTangan":
          "untuk menghitung lingkar tangan yaitu ukuran yang diambil di sekeliling pergelangan tangan. Pengukuran ini penting untuk memastikan bahwa ujung lengan kebaya pas dan nyaman di pergelangan tangan, serta tidak terlalu longgar atau terlalu sempit.",
      "panjangMuka":
          "Ukur dari lekuk leher depan tengah lurus ke bawah hingga batas pinggang.",
    };

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Info $label"),
          content: Text(_measurementDescriptions[label] ??
              "Tidak ada informasi tersedia."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void handleCustomProduct(BuildContext context, ProductModel product,
      Map<String, TextEditingController> controllers) {
    CustomProductViewModel()
        .customProduct(
      productId: product.id,
      name: product.name,
      lebarBahu: controllers["lebarBahu"]!.text,
      lebarMuka: controllers["lebarMuka"]!.text,
      lingkarDada: controllers["lingkarDada"]!.text,
      lingkarKetiak: controllers["lingkarKetiak"]!.text,
      lingkarPinggang: controllers["lingkarPinggang"]!.text,
      lingkarPinggul: controllers["lingkarPinggul"]!.text,
      lingkarTangan: controllers["lingkarTangan"]!.text,
      panjangMuka: controllers["panjangMuka"]!.text,
    )
        .then((value) {
      if (value.message == "Custom Product Created Successfully") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutScreen(product: product),
          ),
        );
      } else {
        print(value);
      }
    });
  }
}
