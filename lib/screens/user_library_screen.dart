import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/library.dart';

// This has the details for
// The user library screen, which contains the purchased books 
// Redirected from the cart screen

class UserLibrary extends StatefulWidget {
  static const routeName = '/user-library';

  @override
  _UserLibraryState createState() => _UserLibraryState();
}

class _UserLibraryState extends State<UserLibrary> {
  
  bool isBoy = false;
  @override
  Widget build(BuildContext context) {
  
    final deviceSize = MediaQuery.of(context).size.height;
    final libraryItem = Provider.of<Library>(context);
   
    return Scaffold(
      backgroundColor:
          dark == 1 ? Color.fromRGBO(101, 119, 134, 0.8) : Colors.grey[50],
      body: Stack(
        children: <Widget>[
          //35% of device Size to fill with image
          Column(
            children: <Widget>[
              Container(
                height: deviceSize * 0.35,
                child: Image.asset(
                  'assets/book.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: deviceSize * 0.65,
                width: double.infinity,
                color: Colors.white12,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: deviceSize * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                    // Contains the switch between the user image
                Center(
                  child: CircleAvatar(
                    child: isBoy
                        ? Image.asset(
                            'assets/man.png',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/female.png',
                            fit: BoxFit.contain,
                          ),
                    radius: 50,
                    backgroundColor: dark == 1 ? Colors.black : Colors.white,
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          isBoy = true;
                        });
                      },
                      label: Text('Mr.BookWorm'),
                      icon: Icon(Icons.person),
                      color: Colors.blue,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          isBoy = false;
                        });
                      },
                      icon: Icon(Icons.pregnant_woman),
                      label: Text('Ms.BookWorm'),
                      color: Colors.pink,
                    ),
                    
                  ],
                ),
                SizedBox(height: 20),
                // Gives the grid view of the books available on the 
                // user library
                Expanded(
                  child: GridView.builder(
                    itemCount: libraryItem.library.length,
                    itemBuilder: (ctx, i) {
                      return Center(
                        child: Card(
                          color: Colors.transparent,
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              libraryItem.library[i].imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9 / 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 2,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
