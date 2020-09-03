import 'package:bookish/models/users.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/cart.dart';

class CartList extends StatefulWidget {
  final Cart cart;
  final int i;
  CartList(this.cart, this.i);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {



  @override
  Widget build(BuildContext context) {
    // DIsmissible helps to add swipe to delete animation
    // Several properties are configured here below
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      // A key is needed to identify each card so that
      // only the card we remove is removed and other
      // items are not affected by it
      key: ValueKey(widget.cart.cartItem[widget.i].bookId),
      onDismissed: (direction) {
        setState(() {
          // On swiping , the removeBook method is called
          // code at /models/cart.dart so thta it removes
          // the book from the list of book in the cart
          widget.cart.removeBook(widget.cart.cartItem[widget.i].bookId);
          widget.cart.cartdatabase(Users().getCurrentUser());
        });
      },
      // The UI cofigurations are done below
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 30),
        height: 120,
        width: double.infinity,
        color:
            dark == 1 ? Color.fromRGBO(101, 119, 134, 0.8) : Colors.grey[50],
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(
                widget.cart.cartItem[widget.i].imageUrl,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: dark == 1
                      ? Color.fromRGBO(101, 119, 134, 0.8)
                      : Colors.grey[50],
                  width: 200,
                  child: Text(
                    widget.cart.cartItem[widget.i].title,
                    style: TextStyle(
                        color: dark == 1 ? Colors.white : Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PlayfairDisplay-Italic'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  widget.cart.cartItem[widget.i].author,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay-Italic',
                      color: dark == 1 ? Colors.grey[200] : Colors.black54),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '\$ ${widget.cart.cartItem[widget.i].price}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay-Italic',
                      color: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
