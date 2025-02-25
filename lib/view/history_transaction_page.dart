import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:flutter_application_1/viewmodels/payment_viewmodel.dart';

class TransactionHistoryPage extends StatefulWidget {
  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  // Sample transaction data
  @override
  void initState() {
   getHistoryTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: _listTransac.length,
        itemBuilder: (context, index) {
          final transaction = _listTransac[index];
          final checkout = transaction.checkout;
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction ID: ${transaction.id}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Total Price: ${transaction.total_price}'),
                  SizedBox(height: 8),
                  Text('Created At: ${transaction.createdAt}'),
                  SizedBox(height: 8),
                  Text(
                    'Shipping Address:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${checkout?.address}, ${checkout?.kecamatan}, ${checkout?.kota}, ${checkout?.provinsi}, ${checkout?.kode_pos}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<TransactionModel> _listTransac = [];
  getHistoryTransaction(){
    PaymentViewmodel().history().then((value) {
      if (value.success){
        UnmodifiableListView listData = UnmodifiableListView(value.data);
        setState(() {
          _listTransac = listData.map((e) => TransactionModel.fromJson(e)).toList();
        });
      } else {
        setState(() {
          _listTransac = [];
        });
      }
    },);
  }
}
