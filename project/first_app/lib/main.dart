//Muhammad Nazrin Bin Hazrul Nizam
//18 Oct 2023
//11.37 pm
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueAccent),
    home: Scaffold(
      appBar: AppBar(title: const Text("CSM3114 Course"),
      ),
      body: const Center(child: Text("Welcome to CSM3114 course"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //bussiness logic
        },
        child: const Icon(Icons.add),
      ),
    )
  ));
}
