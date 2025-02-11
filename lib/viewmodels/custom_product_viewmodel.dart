

import 'dart:io';

import 'package:flutter/material.dart';

import '../config/endpoint.dart';
import '../config/model/resp.dart';
import '../config/network.dart';
import '../config/pref.dart';

class CustomProductViewModel {
  Future<Resp> customProduct({productId, name,lingkarDada,panjangMuka, lebarMuka, lebarBahu, lingkarPinggang, lingkarPinggul, lingkarKetiak, lingkarTangan}) async {
    String? token = await Session().getUserToken();
    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(token);

    Map<String, dynamic> formData = {
      "product_id": productId,
      "name": name,
      "lingkar_dada": lingkarDada,
      "panjang_muka": panjangMuka,
      "lebar_muka": lebarMuka,
      "lebar_bahu": lebarBahu,
      "lingkar_pinggang": lingkarPinggang,
      "lingkar_pinggul": lingkarPinggul,
      "lingkar_ketiak": lingkarKetiak,
      "lingkar_tangan": lingkarTangan,
    };

    // debugPrint(formData.toString());

    var resp = await Network.postApiWithHeadersContentType(Endpoint.customProductUrl, formData, header);
    // print("resp $resp");
    var data = Resp.fromJson(resp);
    return data;
  }
}