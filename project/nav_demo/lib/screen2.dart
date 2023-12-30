//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//3 Dec 2023
//10.12 am
import 'package:flutter/material.dart';
import 'screen3.dart';

class Screen2 extends StatelessWidget {
  // const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Text('Name: '),
                  Text('Staff Number: '),
                  Text('Department: ')
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Screen3();
                  }),
                );
              },
              child: Text('Vote Now'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/');
              },
              child: Text('Home'))
          ],
        ),
      ),
    );
  }
}
