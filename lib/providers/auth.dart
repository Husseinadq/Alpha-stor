import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDWk8vc0wEM3kHYDuswdVpm_ZSRy6KgGrI');
    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
            
            
  }
}
