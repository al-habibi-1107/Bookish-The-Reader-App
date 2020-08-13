import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartList extends StatelessWidget {
  final Cart cart;
  final int i;
  CartList(this.cart,this.i);
  @override
  Widget build(BuildContext context) {
    return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.only(left: 30),
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                cart.cartItem[i].imageUrl,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: Text(
                                    cart.cartItem[i].title,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'PlayfairDisplay-Italic'),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  cart.cartItem[i].author,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'PlayfairDisplay-Italic',
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '\$ ${cart.cartItem[i].price}',
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
                      );;
  }
}