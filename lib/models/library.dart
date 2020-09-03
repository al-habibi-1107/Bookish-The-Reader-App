import 'package:bookish/helpers/db_helper.dart';
import 'package:flutter/material.dart';


import './book.dart';
import './books.dart';


class Library with ChangeNotifier {
  

  

  List<Book> _library = [

  ];

  List<Book> get library {
    return _library;
  }


  // add the book to the library database 
  void addtolib(Book books,String user) {
    _library.add(books);
    DBHelper.insertLibrary('library', {
      'bookId':books.bookId,
      'user':user
    });
    notifyListeners();
  }

// Function to get all the data of the library from the database
  void getBooks(String user)async{
   final database = await DBHelper.getLibraryData('library',user);
   _library= database.map((item) {
     return Books().getBookById(item['bookId']);
   }).toList();
  }



}
