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
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          BookScreen.routename: (ctx) => BookScreen(),

        },
      ),
    );
  }
}
