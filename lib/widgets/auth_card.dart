import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';
import '../screens/home_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final _formKey = GlobalKey<FormState>();

  String _userName = '';
  String _email = '';
  String _password = '';

  void _saveForm() {

    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();

      if (!_isLogin) {
        if (!Provider.of<Users>(context)
            .addUser(_userName, _password, _email)) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'User with that email alreaduy exists',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          print('signup sucessful');
        }
      } else {
        if (Provider.of<Users>(context).isAuth(_password, _email)) {
          print('login successful');
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text(
                'Invalid Username or Password',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
    }
  }

  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isLogin ? 350 : 410,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = true;
                        });
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              _isLogin ? FontWeight.bold : FontWeight.normal,
                          decoration: _isLogin
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: Colors.orange,
                        ),
                      ),
                      textColor: _isLogin ? Colors.black : Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = false;
                        });
                      },
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              !_isLogin ? FontWeight.bold : FontWeight.normal,
                          decoration: !_isLogin
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: Colors.orange,
                        ),
                      ),
                      textColor: !_isLogin ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
                if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      icon: Icon(Icons.perm_identity),
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Username should be atleast 5 charecters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userName = value;
                    },
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password should be atleast 5 charecters long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 30),
                FloatingActionButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: Color.fromRGBO(253, 174, 107, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
