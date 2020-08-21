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

  void addtolib(Book books,String user) {
    _library.add(books);
    DBHelper.insertLibrary('library', {
      'bookId':books.bookId,
      'user':user
    });
    notifyListeners();
  }

  void getBooks()async{
   final database = await DBHelper.getLibraryData('library');
   _library= database.map((item) {
     return Books().getBookById(item['bookId']);
   }).toList();
  }

  
}
