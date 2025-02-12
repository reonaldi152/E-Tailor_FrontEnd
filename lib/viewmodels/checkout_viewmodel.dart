import 'dart:io';

import 'package:flutter/material.dart';

import '../config/endpoint.dart';
import '../config/model/resp.dart';
import '../config/network.dart';
import '../config/pref.dart';

class CheckoutViewModel {
  Future<Resp> checkout({productId, quantity, provinsi, kota, kecamatan, kodePos, address,totalPrice}) async {
    String? token = await Session().getUserToken();
    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(token);

    Map<String, dynamic> formData = {
      "product_id": productId,
      "quantity": quantity,
      "provinsi": provinsi,
      "kota": kota,
      "kecamatan": kecamatan,
      "kode_pos": kodePos,
      "address": address,
      "total_price": totalPrice,
    };

    // debugPrint(formData.toString());

    var resp = await Network.postApiWithHeadersContentType(Endpoint.checkoutsUrl, formData, header);
    // print("resp $resp");
    var data = Resp.fromJson(resp);
    return data;
  }
}
