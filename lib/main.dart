import 'package:flutter/material.dart';
import 'package:flutter_todo_firebase/blocs/todo_bloc.dart';
import 'package:flutter_todo_firebase/pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      builder: (context) => Todos(),
    );
  }
}
