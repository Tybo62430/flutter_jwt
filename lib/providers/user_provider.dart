import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_jwt/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final String host = 'http://10.0.2.2:8000';
  late User user;

  void UpdateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}
