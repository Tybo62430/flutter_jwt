import 'package:flutter/cupertino.dart';
import 'package:flutter_jwt/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late User user;

  void UpdateUser(User updatedUser) {
    user = updatedUser;
    notifyListeners();
  }
}
