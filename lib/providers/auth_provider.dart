import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_jwt/models/signup_form_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  final String host = 'http://10.0.2.2:8000';
  bool isLoading = false;

  Future<dynamic> signup(SignupForm signupForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(Uri.parse('$host/api/users'),
          headers: {"Content-type": "application/json"},
          body: json.encode(signupForm.toJson()));
      isLoading = false;
      if (response.statusCode != 201) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
