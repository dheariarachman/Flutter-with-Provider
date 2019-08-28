import 'package:flutter/material.dart';
import 'package:flutter_todo_firebase/blocs/todo_bloc.dart';
import 'package:flutter_todo_firebase/components/card_todo.dart';
import 'package:flutter_todo_firebase/components/form.dart';
import 'package:flutter_todo_firebase/components/nodata.dart';
import 'package:flutter_todo_firebase/models/todo.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _todoBloc = Provider.of<Todos>(context);

    void _showDialog() {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text('Alert Dialog'),
              content: FormTodo(),
            );
          });
    }

    void _resetButton() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Text('Reset ?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _todoBloc.removeAllTodo();
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          (_todoBloc.todos.length > 0)
              ? IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: _resetButton,
                  padding: EdgeInsets.only(right: 10.0),
                )
              : IconButton(
                  icon: Icon(Icons.block),
                  onPressed: () {},
                )
        ],
      ),
      body: Container(
        child: (_todoBloc.todos.length <= 0)
            ? NoData()
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) => CardTodo(
                  todo: _todoBloc.todos[index],
                  onCheckboxChanged: (bool value) =>
                      _todoBloc.setStatus(value, index),
                  onRemoveTodo: (Todo todo) => _todoBloc.removeTodo(todo),
                ),
                itemCount: _todoBloc.todos.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
