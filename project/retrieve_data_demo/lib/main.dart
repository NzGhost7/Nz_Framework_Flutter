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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Handling Data Change',
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
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  late FocusNode currentFocus;

  @override
  void initState() {
    super.initState();
    currentFocus = FocusNode();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();

    currentFocus.dispose();
    super.dispose();

    @override
    Widget build(BuildContext context) {
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                  labelText: 'Car Plate No',
                  hintText: 'Car Plate No',
                  prefixIcon: Icon(
                    Icons.car_rental_outlined,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 3,
                    color: Colors.purple,
                  ))),
              focusNode: currentFocus,
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: secondController,
              decoration: const InputDecoration(
                  labelText: 'Car Model',
                  hintText: 'Car Model',
                  prefixIcon: Icon(
                    Icons.model_training,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 3,
                    color: Colors.purple,
                  ))),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Display Car Info'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Car Plate No: ${firstController.text}'),
                      const SizedBox(height: 10,),
                      Text('Car Model: ${secondController.text}'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      firstController.text = '';
                      secondController.text = '';
                      currentFocus.requestFocus();
                    }, 
                    child: const Text('Close'),
                    )
                ],
              );
            });
      },
      tooltip: 'Display the values...!',
      child: const Icon(Icons.star),
      ),
    );
  }
}
