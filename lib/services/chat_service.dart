import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/endpoint.dart';
import 'package:flutter_application_1/config/network.dart';
import 'package:flutter_application_1/config/pref.dart';

class ChatService {
  final Dio _dio = Dio();

  Future<void> sendMessage(String text) async {
    String? token = await Session().getUserToken();
    try {
      await _dio.post(
        '${Endpoint.baseUrl}/send-message',
        data: {'text': text},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  Future<List<dynamic>> getMessages() async {
    String? token = await Session().getUserToken();
    try {
      Response response = await _dio.get(
        '${Endpoint.baseUrl}/messages',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data['messages'];
    } catch (e) {
      print("Error fetching messages: $e");
      return [];
    }
  }
}
