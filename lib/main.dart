import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(accentColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Tasks",
            style:
                TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Todo(),
        
      ),
    );
  }
}
