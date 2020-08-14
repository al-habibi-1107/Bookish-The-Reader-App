

import 'package:bookish/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  static const routname = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    //To access device size 
    final device = MediaQuery.of(context).size;
    // To access elements/methods of Cart class at /models/cart.dart
    final cart = Provider.of<Cart>(context);
    // To access the total price method at cart.dart
    final total = cart.totalPrice();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //The cross icon navigates to the previous page
            Container(
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text('A Total Of ${cart.cartItem.length} items')
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      // To display a Widget containing the info of the book
                      // code at /widgets/cart_list.dart
                      return CartList(cart, i);
                    },
                    itemCount: cart.cartItem.length),
              ),
            ),
            // The bottom Button 
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${total.toStringAsPrecision(3)}',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 45),
                    Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color:Colors.grey,offset:Offset(2,3))
                  ],
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(
                  left: device.width * 0.12,
                  bottom: device.height * 0.1,
                ),
                width: 270,
                height: 55,
              ),
            )
          ],
        ),
      ),
    );
  }
}
