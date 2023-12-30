import 'package:flutter/material.dart';
import 'activity_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ... (existing code)

  @override
  Widget build(BuildContext context) {
    // ... (existing code)
    return MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,
      home: ActivityList(),
    );
  }
}
