import 'package:flutter/material.dart';


import './user.dart';

// ChangeNotifier enables provider to be accessible

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

  // A function to Add a new user to the List of Users
  // Gets called when SignUp is done

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

  // A function to login a user with valid credentials
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
