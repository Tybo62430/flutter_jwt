import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_jwt/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final String host = 'http://10.0.2.2:8000';
  bool isLoading = false;
  late User user;

  void UpdateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }

  Future<dynamic> getCurrentUser(String token) async {
    try {
      isLoading = true;
      http.Response response = await http.get(
        Uri.parse('$host/api/me'),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      isLoading = false;
      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));
        return user;
      }
      return null;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
