import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/view/Payment_screen.dart';
import 'package:flutter_application_1/viewmodels/checkout_viewmodel.dart';
import 'package:flutter_application_1/viewmodels/payment_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/product_model.dart';

class CheckoutScreen extends StatefulWidget {
  final ProductModel product;

  const CheckoutScreen({Key? key, required this.product}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  double _totalPrice = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    _quantityController.removeListener(_calculateTotal);
    _quantityController.dispose();
    _provinceController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _postalCodeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    setState(() {
      int quantity = int.tryParse(_quantityController.text) ?? 0;
      _totalPrice = quantity * double.parse(widget.product.price.toString());
    });
  }

  Future<void> handleCheckout() async {
    // Validasi input terlebih dahulu

    if (_quantityController.text.isEmpty ||
        _provinceController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _districtController.text.isEmpty ||
        _postalCodeController.text.isEmpty ||
        _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Harap isi semua field sebelum checkout."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final checkoutResponse = await CheckoutViewModel().checkout(
        productId: widget.product.id,
        quantity: _quantityController.text,
        provinsi: _provinceController.text,
        kota: _cityController.text,
        kecamatan: _districtController.text,
        kodePos: _postalCodeController.text,
        address: _addressController.text,
        totalPrice: _totalPrice,
      );

      if (checkoutResponse.message == "Checkout successfully created") {
        final paymentResponse = await PaymentViewmodel().payment(
          checkoutId: checkoutResponse.data['id'],
        );

        if (paymentResponse.message == "Transaction created successfully") {
          String? paymentUrl = paymentResponse.data['payment_url'];

          if (paymentUrl != null) {
            Uri paymentUri = Uri.parse(paymentUrl);
            if (await canLaunchUrl(paymentUri)) {
              await launchUrl(paymentUri);
            } else {
              throw 'Could not launch payment URL';
            }
          }
        }
      }
    } catch (e) {
      debugPrint("Checkout error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Terjadi kesalahan: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Konfirmasi Pembayaran"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                handleCheckout();
              },
              child: const Text("Lanjutkan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.product.image,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 150),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              _buildNumericTextField("Jumlah (Meter)",
                  controller: _quantityController),
              _buildTextField("Provinsi", controller: _provinceController),
              _buildTextField("Kota", controller: _cityController),
              _buildTextField("Kecamatan", controller: _districtController),
              _buildTextField("Kode Pos", controller: _postalCodeController),
              _buildTextField("Alamat Lengkap", controller: _addressController),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total: RP ${_totalPrice.toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 16)),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _showConfirmationDialog,
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Konfirmasi Pembayaran"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildNumericTextField(String label,
      {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
