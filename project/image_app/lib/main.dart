//Muhammad Nazrin BIn HAzrul Nizam
//S63683
//29 Oct 2023
//9.30 am
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CarImage(),
  ));
}

class CarImage extends StatefulWidget {
  @override
  CarImage({super.key});
  State<StatefulWidget> createState() {
    return _CarImage();
  }
}

class _CarImage extends State<CarImage> {
  String gambo = 'images/extension.jpg';

  void bmw() {
    setState(() {
      gambo = 'images/extension.jpg';
    });
  }

  void S15() {
    setState(() {
      gambo = 'images/extension2.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[500],
        appBar: AppBar(
          title: Text('Image App'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Column(
            children: [
              Image(image: AssetImage(gambo)),
              ElevatedButton(
                onPressed: bmw, 
                child: Text('BMW', style: TextStyle(color: Colors.black),)),
              ElevatedButton(
                onPressed: S15,
                child: Text('S15', style: TextStyle(color: Colors.black ) )),
            ],
          ),
        ),
      ),
    );
  }
}
