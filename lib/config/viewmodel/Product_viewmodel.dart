import 'package:flutter_application_1/config/endpoint.dart';
import 'package:flutter_application_1/config/model/resp.dart';
import 'package:flutter_application_1/config/network.dart';

class ProductViewmodel {
  Future<Resp> products() async {
    var resp = await Network.getApi(Endpoint.productUrl);
    Resp data = Resp.fromJson(resp);
    return data;
  }
}
