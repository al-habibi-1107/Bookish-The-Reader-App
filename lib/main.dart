import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './models/users.dart';
import './screens/home_screen.dart';
import './models/books.dart';
import './screens/book_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Users(),
        ),
        ChangeNotifierProvider.value(
          value: Books(),
        ),
      ],
      child: MaterialApp(
        title: 'Bookish',
        // Authorisation Screen - HomePage of the app
        // email - admin@admin.com
        // password - adminname
        home: AuthScreen(),
        // routes has the route to all pages in the app for 
        // easy navigation between them
        routes: {
        // HomeScreen - Contains the List of All books 
          HomeScreen.routeName: (ctx) => HomeScreen(),
        // BookScreen - Contains the Info on a Specific Book
          BookScreen.routename: (ctx) => BookScreen(),

        },
      ),
    );
  }
}
