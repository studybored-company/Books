import 'package:books/api/api.dart';
import 'package:books/models/book.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBook extends StatefulWidget {
  @override
  _UpdateBook createState() => _UpdateBook();
}

class _UpdateBook extends State<UpdateBook> {
  final booknameController = TextEditingController();
  final bookcategoryController = TextEditingController();

  void onUpdate() {
    final String nameVal = booknameController.text;
    final String catval = bookcategoryController.text;

    if (nameVal.isNotEmpty && catval.isNotEmpty) {
      final Book book = Book(name: nameVal, category: catval);
      Provider.of<BookProvider>(context, listen: false).updateBook(
          book, booknameController.text, bookcategoryController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Book"),
      ),
      body: ListView(children: [
        Container(
          child: Column(
            children: [
              TextField(
                  controller: booknameController,
                  decoration: InputDecoration(hintText: 'Rename Book')),
              TextField(
                  controller: bookcategoryController,
                  decoration: InputDecoration(hintText: 'Rename category')),
              RaisedButton(
                  child: Text('Update'),
                  onPressed: () {
                    onUpdate();
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ]),
    );
  }
}
