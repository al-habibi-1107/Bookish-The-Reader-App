import 'package:flutter/material.dart';

import '../helpers/db_helper.dart';
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

  Future<bool> addUser(String uname, String password, String email) async {
    bool _isPresent = false;
    
    final database = await DBHelper.getData('users');
    _users = database
        .map(
          (item) => User(
            email: item['email'],
            password: item['password'],
            username: item['username'],
          ),
        )
        .toList();

    _users.forEach((data) {
      if (data.email == email) {
        print('email exists');
        _isPresent = true;
      }
    });
    if (_isPresent) {
      print('do not sign up');
      return false;
    }else{
      DBHelper.insert(
        'users', {'username': uname, 'email': email, 'password': password});
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
  Future<bool> isAuth(String password, String email) async {
    bool userPresent = false;

    final database = await DBHelper.getData('users');

    _users = database
        .map(
          (item) => User(
            email: item['email'],
            password: item['password'],
            username: item['username'],
          ),
        )
        .toList();
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
