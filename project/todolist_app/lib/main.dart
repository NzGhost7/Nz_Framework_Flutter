//Muhammad Nazrin Bin Hazrul Nizam
//S63683

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyMainPage()));

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List<String> _todoRecords = ['Task 1', 'Task 2', 'Task 3', 'Task 4'];

  void _addingToD0() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newToDo = '';
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: Text('Enter New Task Below: ', style: TextStyle(color: Colors.white),),
          content: TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            onChanged: (value) {
              newToDo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoRecords.add(newToDo);
                });
                Navigator.of(context).pop();
              },
              child: Text('Submit',style: TextStyle(color: Colors.white)),
            )
          ],
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('To Do List', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Times New Roman', color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: ListView.builder(
        itemCount: _todoRecords.length,
        itemBuilder: (context, index) {
          final toDo = _todoRecords[index];

          return ListTile(
            title: Text(toDo, style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'monospace'), textAlign: TextAlign.center),
            onTap: () {
              setState(() {
                _todoRecords.removeAt(index);
              });
            },
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[400],
          child: Icon(Icons.add, color: Colors.black),
          onPressed: _addingToD0,
        ),
    );
  }
}