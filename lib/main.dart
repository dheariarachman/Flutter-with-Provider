import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_firebase/blocs/salaries_bloc.dart';
import 'package:flutter_todo_firebase/blocs/todo_bloc.dart';
import 'package:flutter_todo_firebase/pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blue, statusBarColor: Colors.blue));

    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider(
          builder: (context) => Todos(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Salaries(),
        )
      ],
    );
  }
}
