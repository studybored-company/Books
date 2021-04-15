// import 'package:flutter/material.dart';

class Book {
  int id;
  final String name;
  final String category;
  // final String price;

  Book({this.id, this.name, this.category});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        name: json['name'].toString(),
        // price: json['price'],
        category: json['category'].toString());
  }
  dynamic toJson() =>
      {'id': id, 'name': name,'category': category};
}
