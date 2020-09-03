import 'package:flutter/material.dart';

// Definition of a user , how a user looks like
class User {
  final String username;
  final String email;
  final String password;
   num bucks;
  User({
    @required this.username,
    @required this.password,
    @required this.email,
    this.bucks,
  });
}
