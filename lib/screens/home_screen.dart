import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75,99,169, 1),
        appBar: AppBar(title: Text('Login Screen'),backgroundColor: Color.fromRGBO(75,99,169, 1),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hey There User,\nYou Sucessfully logged in!!',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 10),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,color: Colors.white,),
                label: Text('Logout',style: TextStyle(color:Colors.white),),
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
              )
            ],
          ),
        ));
  }
}
