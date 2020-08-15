import 'package:flutter/material.dart';


import './book.dart';
import '../models/books.dart';

class Cart with ChangeNotifier {
  List<Book> _cartItem = [
    
  ];

  List<Book> get cartItem {
    return _cartItem;
  }
   List<Book>bookList=Books().books;

  void addBook(double bookId) {
  
   final Book currentBook= bookList.firstWhere((element) => element.bookId==bookId);
   _cartItem.add(currentBook);
    notifyListeners();
  }

  void removeBook(double bookId) {
    final Book currentBook= bookList.firstWhere((element) => element.bookId==bookId);
    _cartItem.remove(currentBook);
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
