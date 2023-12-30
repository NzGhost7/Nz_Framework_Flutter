import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validate Demo'),
          centerTitle: true,
        ),
        body: const MyMainUI(),
        )
    );
  }
}

class MyMainUI extends StatefulWidget {
  const MyMainUI({super.key});

  @override
  State<MyMainUI> createState() => _MyMainUIState();
}

class _MyMainUIState extends State<MyMainUI> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40,),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Matric No',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.pink),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            controller: _textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                print('Debug main.dart -> Data entry is Null...!');
                return "Please enter the Matric No";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Student Matric No: ${_textController.text}')),
                  );
                  print('Debug main.dart -> Student Matric No : ${_textController.text}');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              child: const Text('Submit'),
            ),
            )
        ],
      )
      );
  }
}