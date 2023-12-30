//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//3 Dec 2023
//10.12 am
import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) => Screen1(),
        '/first' :(context) => Screen2(),
        '/second' :(context) => Screen3(),
      },
    );
  }
}


