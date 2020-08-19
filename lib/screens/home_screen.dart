import 'package:bookish/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_card.dart';
import '../models/cart.dart';
import './user_library_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void _selectPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.height;

    return Scaffold(
      // Stack - To stack the List of cards on
      // the background
      body: Stack(
        children: <Widget>[
          //35% of device Size to fill with image
          Container(
            height: deviceSize * 0.35,
            child: Image.asset(
              'assets/book.jpg',
              fit: BoxFit.contain,
            ),
          ),
          // Stack Level 2
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                child: PopupMenuButton(
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: FlatButton(
                        child: Text('Logout'),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                    )
                  ],
                  icon: Icon(Icons.more_vert),
                ),
              ),
              SizedBox(height: deviceSize * 0.14),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 400,
                width: double.infinity,
                // The Home Card Widget, Code in widgets/home_card.dart
                child: HomeCard(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (index) => _selectPage(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(child: Icon(Icons.library_books),onTap: (){
              Navigator.of(context).pushNamed(UserLibrary.routeName);
            },),
            title: Text('My Library'),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routname);
              },
            ),
            title: GestureDetector(
              child: Text('Cart'),
              onTap: () {
                Provider.of<Cart>(context).cartdatabase();
                Navigator.of(context).pushNamed(CartScreen.routname);
              },
            ),
          )
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
      ),
    );
  }
}
