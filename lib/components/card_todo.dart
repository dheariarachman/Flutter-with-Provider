import 'package:flutter/material.dart';
import 'package:flutter_todo_firebase/models/todo.dart';

typedef CheckedCallback = void Function(bool val);
typedef RemoveCallback = void Function(Todo todo);

class CardTodo extends StatelessWidget {
  final Todo todo;
  final CheckedCallback onCheckboxChanged;
  final RemoveCallback onRemoveTodo;
  const CardTodo({this.todo, this.onCheckboxChanged, this.onRemoveTodo});

  @override
  Widget build(BuildContext context) {
    void _displayDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Delete ' + todo.todo + ' ?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    onRemoveTodo(todo);
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'),
                ),
              ],
            );
          });
    }

    return Card(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              onChanged: (bool value) => onCheckboxChanged(value),
              controlAffinity: ListTileControlAffinity.leading,
              value: todo.status,
              title: Text(
                todo.todo,
                style: TextStyle(decorationStyle: TextDecorationStyle.dotted),
              ),
              secondary: FlatButton.icon(
                icon: Icon(Icons.remove_circle),
                label: Text(''),
                onPressed: _displayDialog,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
