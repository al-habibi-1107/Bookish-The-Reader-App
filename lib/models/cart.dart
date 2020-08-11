
import 'package:flutter/material.dart';


import './book.dart';

class Cart with ChangeNotifier{
 
 

 List<Book> _cartItem=[];

 List<Book> get cartItem{
   return _cartItem;
 }

void addBook(Book cartBook){
  _cartItem.add(cartBook);
}

void removeBook(Book cartBook){
  _cartItem.remove(cartBook);
}
}