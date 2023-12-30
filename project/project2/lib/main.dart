import 'package:flutter/material.dart';
import 'package:project2/widget/all_park_list.dart';
import 'package:project2/widget/login.dart';
import 'package:project2/widget/park_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: theDrawer(),
    );
  }
}

class theDrawer extends StatelessWidget {
  //const theDrawer({super.key});

  Widget content = AllParkList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Find Parking'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            DrawerHeader(
              child: Text('Smart Parking App'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
                title: const Text('Your Parking'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ParkList()));
                }),
            ListTile(
                title: const Text('Login'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }),
            ListTile(title: const Text('Complain'), onTap: () {}),
          ]),
        ),
        body: content,);
  }
}
