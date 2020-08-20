import 'package:bookish/helpers/db_helper.dart';
import 'package:flutter/material.dart';


import './book.dart';


class Library with ChangeNotifier {
  

  

  final List<Book> _library = [

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
}
