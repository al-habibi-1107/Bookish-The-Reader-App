import 'package:flutter/material.dart';

import '../helpers/db_helper.dart';
import './user.dart';

// ChangeNotifier enables provider to be accessible

class Users with ChangeNotifier {
  String _currentUser = '';
  String _currentUsername = '';
  double _bucks=0;
  List<User> _users = [
    User(
      username: 'adminname',
      password: 'adminname',
      email: 'admin@admin.com',
      bucks: 100,
    ),
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
    } else {
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

  // Sets the current user as logged in user
  void setCurrentUser(String user, String userName,) {
    _currentUser = user;
    _currentUsername = userName;
    
  }

  String getCurrentUser() {
    return _currentUser;
  }

  String getCurrentUserName() {
    return _currentUsername;
  }

  // for each signup sets the initial value of bucks
  // and enters it to the database
  Future<void> setInitialBucks(String user) async {
    DBHelper.insertBucks('bucks', {'user': user, 'cash': 100});
    _bucks=100;
    notifyListeners();
  }

  // for each login , gets the data of the user
  // and sets the bucks respectively
  Future<void> setUserBucks(String user) async {

    final userName= _users.firstWhere((element) => element.email==user);
    print(userName.email);


    final db = await DBHelper.getUserBucks('bucks', userName.email);
    db.forEach((element) { 
      userName.bucks=element['cash'];
    });
    _bucks=userName.bucks;
    notifyListeners();
  }
  double get bucks{
   
    return _bucks;
   
  }
  
// Handles the transactions done 
// ie the books purchased 
  Future<void> transaction(double amount,)async{
    print(_currentUser);
    amount=_bucks-amount;
    DBHelper.transaction('bucks', _currentUser, amount);
    notifyListeners();
  }




}
