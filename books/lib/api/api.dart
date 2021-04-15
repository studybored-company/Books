import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:books/models/book.dart';
import 'package:http/http.dart' as http;

class BookProvider with ChangeNotifier {
  BookProvider() {
    this.fetchBooks();
  }
  List<Book> _list = [];

  List<Book> get books {
    return [..._list];
  }

  void changeScreen(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void addBook(Book book) async {
    final response = await http.post('http://10.0.2.2:8000/book/v1',
        headers: {"Content-Type": "application/json"}, body: json.encode(book));
    if (response.statusCode == 201) {
      book.id = json.decode(response.body)['id'];
      _list.add(book);
      notifyListeners();
    }
  }

  void updateBook(Book book, String bkname, String bkcategory) async {
    final response = await http.put(
        'http://10.0.2.2:8000/book/v1/${book.id}/<string:$bkname>/<string:$bkcategory>/',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(book));
    if (response.statusCode == 201) {
      book.id = json.decode(response.body)['id'];
      _list.add(book);
      notifyListeners();
    }
  }

  void deleteBook(Book book) async {
    final response =
        await http.delete('http://10.0.2.2:8000/book/v1/${book.id}/');
    if (response.statusCode == 204) {
      _list.remove(book);
      notifyListeners();
    }
  }

//
// Future<http.Response> fetchBooks() async {
  fetchBooks() async {
    final url = 'http://10.0.2.2:8000/book/v1';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Backend data successfully fetched');

      // try {
      var data = json.decode(response.body) as List;
      _list = data.map<Book>((json) => Book.fromJson(json)).toList();
      // } catch (Exception) {
      // print("Some Error occured");
      // }
      notifyListeners();
    } else {
      print('Error: ' + response.statusCode.toString());
    }
  }
}
