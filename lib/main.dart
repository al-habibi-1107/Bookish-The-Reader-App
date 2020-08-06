import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './models/users.dart';
import './screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (ctx)=>Users(),

          child: MaterialApp(
        title: 'LoginScreen',
        // theme: ThemeData(
          
        //   primarySwatch: Colors.blue,
          
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        home:AuthScreen(),
        routes: {
          HomeScreen.routeName:(ctx)=>HomeScreen(),
        },
      ),
    );
  }
}

