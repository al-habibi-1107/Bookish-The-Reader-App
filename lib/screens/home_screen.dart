import 'package:bookish/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/home_card.dart';

import './user_library_screen.dart';
import '../models/cart.dart';
import '../models/users.dart';

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
    final bucks= Provider.of<Users>(context).bucks;
    final deviceSize = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:
          dark == 1 ? Color.fromRGBO(170, 184, 194, 1) : Colors.grey[50],
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
          Positioned(
            top: deviceSize * 0.05,
            left: 35,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black)),
              height: 40,
              width: 90,
              child: Row(children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                Text('$bucks'),
              ],),
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
                  color: dark == 1 ? Colors.grey : Colors.white,
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: FlatButton(
                        color: dark == 1 ? Colors.grey[500] : Colors.white,
                        child: Text('Logout',
                            style: TextStyle(
                                color:
                                    dark == 1 ? Colors.white : Colors.black54)),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                    ),
                    PopupMenuItem(
                        child: FlatButton(
                      onPressed: () {
                        setState(() {
                          switchDark();
                        });
                      },
                      child: Text(
                        'Switch Theme',
                        style: TextStyle(
                            color: dark == 1 ? Colors.white : Colors.black54),
                      ),
                    )),
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
        backgroundColor: dark == 1 ? Colors.black54 : Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _selectPage(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.library_books),
              onTap: () {
                Navigator.of(context).pushNamed(UserLibrary.routeName);
              },
            ),
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
                Cart().cartdatabase(Users().getCurrentUser());
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
