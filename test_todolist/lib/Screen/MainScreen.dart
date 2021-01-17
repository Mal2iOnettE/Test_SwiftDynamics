import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  const MyHomePage({Key key, this.name}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      if (task.length > 0) {
        setState(() => _todoItems.add(task));
      }
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return Card(
      child: ListTile(
        title: Text(
          todoText,
          style: Theme.of(context).textTheme.headline2), 

        onTap: () => _promptRemoveTodoItem(index)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(onPressed: _addNewList, tooltip: 'Add task', child: Icon(Icons.add)),
    );
  }


  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _addNewList() {
    var str;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Add New List'),
              content: TextField(
                autofocus: true,
                onChanged: (val) {
                  str = val;
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  hintText: 'Enter something to do...',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
             
                  contentPadding: const EdgeInsets.all(16.0)),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'CANCEL',
                    style: Theme.of(context).textTheme.headline6.merge(
                      TextStyle(
                        color: Color(0xFFe63946)
                      )
                    ),
                    ), 
                  onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: new Text(
                      'SVAE',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () {
                      _addTodoItem(str);
                      Navigator.pop(context); //
                    }),
              ]);
        });
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text('Mark "${_todoItems[index]}" as done?'), actions: <Widget>[
            FlatButton(child: new Text('CANCEL'), onPressed: () => Navigator.of(context).pop()),
            FlatButton(
                child: new Text('MARK AS DONE'),
                onPressed: () {
                  _removeTodoItem(index);
                  Navigator.of(context).pop();
                })
          ]);
        });
  }
}
