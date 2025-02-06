// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  final String baseUrl = 'https://staging-limbah.my.id/api';

  Future<void> registerUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Periksa status code 201 (Created)
      print('User registered successfully');

      // Optional: Decode the successful response if needed
      // try {
      //   final responseData = jsonDecode(response.body);
      //   // Process the responseData (e.g., get the user ID)
      //   print('Response Data: $responseData');
      // } catch (e) {
      //   print('Error decoding response: $e');
      // }
    } else {
      // Print error details for debugging
      print('Failed to register user. Status Code: ${response.statusCode}');
      print(
          'Response Body: ${response.body}'); // Print the error response from the server

      // Optionally, throw a more specific exception with the error message from the server
      try {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ??
            'Failed to register user'; // Extract error message
        throw Exception(errorMessage);
      } catch (e) {
        throw Exception(
            'Failed to register user. Status Code: ${response.statusCode}');
      }
    }
  }
}
