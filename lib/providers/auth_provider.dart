// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/service/api_service.dart';
// import '../models/user.dart';

// class AuthProvider with ChangeNotifier {
//   final AuthService _authService = AuthService();
//   User? _user;
//   String? _token;

//   User? get user => _user;
//   String? get token => _token;

//   Future<void> login(String email, String password) async {
//     _token = await _authService.login(email, password);
//     _user = await _authService.fetchUser();
//     notifyListeners();
//   }

//   Future<void> register(String name, String email, String password) async {
//     _token = await _authService.register(name, email, password);
//     _user = await _authService.fetchUser();
//     notifyListeners();
//   }

//   Future<void> logout() async {
//     await _authService.logout();
//     _user = null;
//     _token = null;
//     notifyListeners();
//   }

//   Future<void> fetchUser() async {
//     _user = await _authService.fetchUser();
//     notifyListeners();
//   }
// }
