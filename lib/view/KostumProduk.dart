import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/custom_product_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomProductView extends StatefulWidget {
  const CustomProductView({Key? key}) : super(key: key);

  @override
  State<CustomProductView> createState() => _CustomProductViewState();
}

class _CustomProductViewState extends State<CustomProductView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CustomProductViewModel>(context, listen: false)
        .fetchCustomProducts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CustomProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('E - Tailor')),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.customProducts.isEmpty
              ? const Center(child: Text("No Custom Products Available"))
              : ListView.builder(
                  itemCount: viewModel.customProducts.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.customProducts[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.name ?? "Custom Pakaian",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            "https://your-image-url.com/sample.jpg",
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          _buildMeasurementField(
                              "Lingkar Dada", product.lingkarDada.toString()),
                          _buildMeasurementField(
                              "Panjang Muka", product.panjangMuka.toString()),
                          _buildMeasurementField(
                              "Lebar Muka", product.lebarMuka.toString()),
                          _buildMeasurementField(
                              "Lebar Bahu", product.lebarBahu.toString()),
                          _buildMeasurementField("Lingkar Pinggang",
                              product.lingkarPinggang.toString()),
                          _buildMeasurementField("Lingkar Pinggul",
                              product.lingkarPinggul.toString()),
                          _buildMeasurementField("Lingkar Ketiak",
                              product.lingkarKetiak.toString()),
                          _buildMeasurementField("Lingkar Tangan",
                              product.lingkarTangan.toString()),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text("Lanjutkan Pembayaran"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }

  Widget _buildMeasurementField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: value,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
