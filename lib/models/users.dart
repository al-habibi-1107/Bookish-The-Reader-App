import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './user.dart';

class Users with ChangeNotifier {
  List<User> _users = [
    User(
      username: 'adminname',
      password: 'adminname',
      email: 'admin@admin.com',
    ),
    User(
      username: 'testusername',
      password: 'testpassword',
      email: 'testemail@test.com',
    )
  ];

  List<User> get users {
    return _users;
  }

  bool addUser(String uname, String password, String email) {
    bool _isPresent = false;

    _users.forEach((data) {
      if (data.email == email) {
        _isPresent = true;
      }
    });
    if (_isPresent) {
      return false;
    }
    _users.add(
      User(
        email: email,
        password: password,
        username: uname,
      ),
    );

    notifyListeners();
    return true;
  }

  bool isAuth(String password, String email) {
    bool userPresent = false;
    _users.forEach((element) {
      if (element.email == email && element.password == password) {
        userPresent = true;
      }
    });
    if (userPresent) {
      return true;
    }
    return false;
  }
}
