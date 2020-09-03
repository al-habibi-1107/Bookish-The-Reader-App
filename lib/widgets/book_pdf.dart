import 'package:flutter/material.dart';

import '../models/book.dart';

class PdfView extends StatelessWidget {
  static const routeName="/pdf-view";
  @override
  Widget build(BuildContext context) {
   Book currentBook= ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body:Column(
        children:[
         IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
           Navigator.of(context).pop();
         } )
        ]
      ) ,
    );
  }
}