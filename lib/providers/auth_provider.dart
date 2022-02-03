import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_jwt/models/signin_form_model.dart';
import 'package:flutter_jwt/models/signup_form_model.dart';
import 'package:flutter_jwt/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  final String host = 'http://10.0.2.2:8000';
  late String token;
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

  Future<dynamic> signin(SigninForm signinForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(Uri.parse('$host/api/login'),
          headers: {"Content-type": "application/json"},
          body: json.encode(signinForm.toJson()));
      final Map<String, dynamic> body = json.decode(response.body);
      if (response.statusCode == 200) {
        // final User user = User.fromJson(body['user']);
        token = body['token'];
        return token;
      } else {
        return body;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
