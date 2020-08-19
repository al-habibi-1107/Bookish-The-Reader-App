import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/users.dart';
import '../screens/home_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  // form Key for Working with saving and showing the Form
  final _formKey = GlobalKey<FormState>();

  // The parameters of the form - initially empty variables
  String _userName = '';
  String _email = '';
  String _password = '';

  // Function for Saving the form and accepting input
  // Called on pressing the arrow button
  void _saveForm() async {
    // To check if all inputs are valid
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      // If all inputs are valid then save the form
      _formKey.currentState.save();

      if (!_isLogin) {
        // if the card is in SignUp mode ,
        // Check if user with that email exists
        // bool to resolve if the user exists
        bool signup = await Provider.of<Users>(context)
            .addUser(_userName, _password, _email);

        // check wether user exists
        if (!signup) {
          Scaffold.of(context).showSnackBar(
            // Show SnackBar with message if user already exists
            SnackBar(
              content: Text(
                'User with that email already exists',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          // Else create a user with the given credentials
          print('signup sucessful');
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          Provider.of<Users>(context).setCurrentUser(_email);
        }
      } else {
        // If card is in Login mode
        // send credentials to isAuth function in models/users.dart
        // if the credentials are right , print login successful and
        // Navigate to HomeScreen
        bool login =
            await Provider.of<Users>(context).isAuth(_password, _email);
        if (login) {
          print('login successful');
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          Provider.of<Users>(context).setCurrentUser(_email);
        } else {
          Scaffold.of(context).showSnackBar(
            // If credentials are not right
            // show a snackbar with message
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
      // if in Login mode then size of card is less
      // if in signup mode change size of card
      height: _isLogin ? 350 : 410,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: dark() == 1 ? Color.fromRGBO(101, 119, 134, 1) : Colors.grey[50],
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        // for Scrollable Card
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
                    // Switch Login and Signup modewith click of button
                    // also call set state to update UI
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
                      textColor: _isLogin
                          ? (dark() == 1 ? Colors.white : Colors.black54)
                          : Colors.grey[400],
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
                      textColor: !_isLogin
                          ? (dark() == 1 ? Colors.white : Colors.black54)
                          : Colors.grey[400],
                    ),
                  ],
                ),
                // If in SignUp mode Show username feild - with some validation
                if (!_isLogin)
                  TextFormField(
                    style: TextStyle(
                      color: (dark() == 1 ? Colors.white : Colors.black54),
                    ),
                    key: ValueKey('username'),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color:
                              (dark() == 1 ? Colors.white60 : Colors.black54)),
                      icon: Icon(Icons.perm_identity,
                          color:
                              (dark() == 1 ? Colors.white70 : Colors.black54)),
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
                  style: TextStyle(
                    color: (dark() == 1 ? Colors.white : Colors.black54),
                  ),
                  key: ValueKey('email'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: (dark() == 1 ? Colors.white60 : Colors.black54)),
                    icon: Icon(Icons.mail,
                        color: (dark() == 1 ? Colors.white70 : Colors.black54)),
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
                  style: TextStyle(
                    color: (dark() == 1 ? Colors.white : Colors.black54),
                  ),
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: (dark() == 1 ? Colors.white60 : Colors.black54)),
                    icon: Icon(Icons.lock,
                        color: (dark() == 1 ? Colors.white70 : Colors.black54)),
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
                // Icon Button to save the form and check validation
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
