//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//16 Dec 2023
//8.50am

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Registration',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selection = 'No Data';

  _userRegistration() async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => Registration()));
      print('Debug main.dart : Passing await...!');
      setState(() {
        _selection = result ?? 'None';
      });
      print('Debug main.dart : _section = $_selection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_selection),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _userRegistration,
              child: Text('Go to Registration'))
          ],
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String noMatric = '';
  String fullName = '';
  String regData = '';

  _register() {
    setState(() {
      regData = 'Matric Number: $noMatric\nFull Name: $fullName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter your matric number'),
              onChanged: (value) {
                noMatric = value;             
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your full name'),
              onChanged: (value) {
                fullName = value;
              },
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                _register();
                Navigator.pop(context, regData);
              }
              ),
          ],
        ),
      ),
    );
  }
}