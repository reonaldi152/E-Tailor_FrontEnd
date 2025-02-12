
import 'dart:io';

import 'package:flutter/material.dart';

import '../config/endpoint.dart';
import '../config/model/resp.dart';
import '../config/network.dart';
import '../config/pref.dart';

class PaymentViewmodel {
  Future<Resp> payment({checkoutId}) async {
    String? token = await Session().getUserToken();
    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(token);

    Map<String, dynamic> formData = {
      "checkout_id": checkoutId,
    };

    // debugPrint(formData.toString());

    var resp = await Network.postApiWithHeadersContentType(Endpoint.paymentUrl, formData, header);
    // print("resp $resp");
    var data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> history() async {
    String? token = await Session().getUserToken();
    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp = await Network.getApiWithHeaders(Endpoint.transactionUrl, header);
    var data = Resp.fromJson(resp);
    return data;
  }
}