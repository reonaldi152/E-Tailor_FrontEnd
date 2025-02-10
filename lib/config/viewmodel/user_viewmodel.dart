import 'package:flutter_application_1/config/endpoint.dart';
import 'package:flutter_application_1/config/model/resp.dart';
import 'dart:io';

import 'package:flutter_application_1/config/network.dart';
import 'package:flutter_application_1/config/pref.dart';

class UserViewmodel {
  Future<Resp> login({email, password}) async {
    Map<String, dynamic> formData = {
      "email": email,
      "password": password,
    };

    var resp = await Network.postApi(Endpoint.authLoginUrl, formData);
    var data = Resp.fromJson(resp);

    return data;
  }

  Future<Resp> register({name, email, password, phone}) async {
    Map<String, dynamic> formData = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone
    };

    var resp = await Network.postApi(Endpoint.authRegisterUrl, formData);
    var data = Resp.fromJson(resp);

    return data;
  }

  Future<Resp> logout() async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp =
        await Network.postApiWithHeadersWithoutData(Endpoint.logoutUrl, header);
    Resp data = Resp.fromJson(resp);
    return data;
  }
}
