import 'package:flutter/material.dart';

import './book.dart';

class Cart with ChangeNotifier {
  List<Book> _cartItem = [
    
  ];

  List<Book> get cartItem {
    return _cartItem;
  }

  void addBook(Book cartBook) {
    _cartItem.add(cartBook);
    notifyListeners();
  }

  void removeBook(Book cartBook) {
    _cartItem.remove(cartBook);
    notifyListeners();
  }

  double totalPrice(){
     double total=0;
    _cartItem.forEach((element) { 
      total=total+element.price;
    });
    return total;
  }
  void clearCart(){
    _cartItem=[];
  }
}
