import 'package:bookish/widgets/book_pdf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './models/users.dart';
import './screens/home_screen.dart';
import './models/books.dart';
import './screens/book_screen.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';
import './models/library.dart';
import './screens/user_library_screen.dart';

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
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Library(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          // CartScreen - Contains all items added to cart
          CartScreen.routname: (ctx) => CartScreen(),
          // UserLibrary - Contains the purchased books
          UserLibrary.routeName: (ctx) => UserLibrary(),
          PdfView.routeName: (ctx)=> PdfView(),

        },
        
      ),
    );
   
  }
   
 
}

//night mode variable
// dark = 1 >> night
// dark = 0 >> day
  int darkVal = 0;
int  get dark {
  return darkVal;
}

void switchDark(){
 if(dark==1){
   darkVal=0;
 }else{
   darkVal=1;
 }
}
