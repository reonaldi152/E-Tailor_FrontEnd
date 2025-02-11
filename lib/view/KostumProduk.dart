import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/viewmodels/custom_product_viewmodel.dart';
import 'checkout.dart';

class CustomProductView extends StatefulWidget {
  const CustomProductView({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<CustomProductView> createState() => _CustomProductViewState();
}

class _CustomProductViewState extends State<CustomProductView> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    "lingkarDada": TextEditingController(),
    "panjangMuka": TextEditingController(),
    "lebarMuka": TextEditingController(),
    "lebarBahu": TextEditingController(),
    "lingkarPinggang": TextEditingController(),
    "lingkarPinggul": TextEditingController(),
    "lingkarKetiak": TextEditingController(),
    "lingkarTangan": TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E - Tailor')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              for (var entry in _controllers.entries)
                _buildMeasurementField(entry.key, entry.value),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleCustomProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Lanjutkan Pembayaran"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeasurementField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void handleCustomProduct() {
    if (_formKey.currentState!.validate()) {
      CustomProductViewModel()
          .customProduct(
        productId: widget.product.id,
        name: widget.product.name,
        lebarBahu: _controllers["lebarBahu"]!.text,
        lebarMuka: _controllers["lebarMuka"]!.text,
        lingkarDada: _controllers["lingkarDada"]!.text,
        lingkarKetiak: _controllers["lingkarKetiak"]!.text,
        lingkarPinggang: _controllers["lingkarPinggang"]!.text,
        lingkarPinggul: _controllers["lingkarPinggul"]!.text,
        lingkarTangan: _controllers["lingkarTangan"]!.text,
        panjangMuka: _controllers["panjangMuka"]!.text,
      )
          .then((value) {
            print(value);
        if (value.message == "Custom Product Created Successfully") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(product: widget.product),
            ),
          );
        } else {
          print(value);
        }
      });
    }
  }
}
