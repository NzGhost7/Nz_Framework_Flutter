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
      home: MyMain(),
    );
  }
} 

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  TextEditingController studname = TextEditingController();
  TextEditingController course = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10,),
              TextField(
                controller: studname,
                decoration: InputDecoration(
                  labelText: "Student Name",
                  hintText: "Enter your name",
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: course,
                decoration: InputDecoration(
                  labelText: "Course",
                  hintText: "Enter your course",
                  prefixIcon: Icon(Icons.folder,),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}