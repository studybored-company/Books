import 'package:books/api/api.dart';
import 'package:books/models/book.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final booknameController = TextEditingController();
  final bookcategoryController = TextEditingController();

  void onAdd() {
    final String nameVal = booknameController.text;
    final String catval = bookcategoryController.text;

    if (nameVal.isNotEmpty && catval.isNotEmpty) {
      final Book book = Book(name: nameVal, category: catval);
      Provider.of<BookProvider>(context, listen: false).addBook(book);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Books"),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                    controller: booknameController,
                    decoration: InputDecoration(hintText: '  Enter Book Name')),
                TextField(
                    controller: bookcategoryController,
                    decoration: InputDecoration(hintText: '  Enter Categeory')),
                RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      onAdd();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
