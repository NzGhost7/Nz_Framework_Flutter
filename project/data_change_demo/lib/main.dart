//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//17 Dec 2023

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Handling Data Change',
      theme: ThemeData(),
      home: MyMainUI(),
    );
  }
}

class MyMainUI extends StatefulWidget {
  const MyMainUI({super.key});

  @override
  State<MyMainUI> createState() => _MyMainUIState();
}

class _MyMainUIState extends State<MyMainUI> {
  final myController = TextEditingController();
  void initState() {
    super.initState();

    myController.addListener(_displayCurrentValue);
  }
  void _displayCurrentValue() {
    print('Debug main.dart -> 2nd TextField update: ${myController.text}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handling Data Changed'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80,),
            TextField(
              onChanged: (value) {
                print('Debug main.dart -> The 1st TextField Update: $value');
              },
              decoration: const InputDecoration(
                labelText: 'Matric No',
                hintText: 'Matric No',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.purple,
                  )
                )
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                hintText: "Student Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.purple,
                  )
                )
              ),
            )
          ],
        ), 
        ),
    );
  }
}