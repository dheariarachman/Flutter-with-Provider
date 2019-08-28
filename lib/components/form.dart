import 'package:flutter/material.dart';
import 'package:flutter_todo_firebase/blocs/todo_bloc.dart';
import 'package:provider/provider.dart';

class FormTodo extends StatefulWidget {
  @override
  _FormTodoState createState() => _FormTodoState();
}

class _FormTodoState extends State<FormTodo> {
  final _formKey = GlobalKey<FormState>();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _todoBloc = Provider.of<Todos>(context);

    void _addToList() {
      _todoBloc.addTodo(todoController.text);
      Navigator.of(context).pop();
    }
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Add Todo"),
              controller: todoController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  onPressed: _addToList,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
