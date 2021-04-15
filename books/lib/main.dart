import 'package:books/api/api.dart';
import 'package:books/screens/addBook.dart';
import 'package:books/screens/updateBook.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'FlutterDemo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookP = Provider.of<BookProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BookList'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: bookP.books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.red[100],
                      offset: Offset(4, 5),
                      blurRadius: 3),
                ],
              ),
              child: ListTile(
                onLongPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateBook()));
                },
                trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      bookP.deleteBook(bookP.books[index]);
                    }),
                    
                title: Text(
                  bookP.books[index].name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  '\n\n' + bookP.books[index].category,
                  // .substring(11, (bookP.books[index].category.length) - 1),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddBookScreen()));
          }),
    );
  }
}
