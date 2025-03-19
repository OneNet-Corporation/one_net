import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';

  String get username => _username;

  void setUsername(String newName) {
    _username = newName;
    notifyListeners();
  }
}
