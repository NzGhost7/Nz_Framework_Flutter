//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//3 Dec 2023
//10.12 am
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  //const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('e-Voting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Text('Employee Details'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Vote the Candidate'),
            ),
          ],
        ),
      ),
    );
  }
}
