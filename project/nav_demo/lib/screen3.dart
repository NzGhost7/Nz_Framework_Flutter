//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//3 Dec 2023
//10.12 am
import 'package:flutter/material.dart';
class Screen3 extends StatelessWidget {
  //const Screen3({super.key});

  String vote = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 3'),
      ),
      body: Center(
        child: Column(
          children: [
            RadioListTile(
              title: Text('Candidate A'),
              value: 1,
              onChanged: (value) {
                Null;
              },
              groupValue: vote,
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          }, 
          child: Text('Go back to Screen 1')
      ),
    );
  }
}