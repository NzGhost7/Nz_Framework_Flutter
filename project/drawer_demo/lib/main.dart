//Muhammad Nazrin Bin Hazrul Nizam S63683
//7/12/2023
//4.54 pm

import 'package:drawer_demo/product_screen.dart';
import 'package:drawer_demo/stock_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(home: MyApp())
  );
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Using Drawer'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('My Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 60.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                child: Text('Drawer Header'),
                ),
            ),
            ListTile(
              title: const Text('Product'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Stock'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => StockScreen(),
                  ));
              },
            )
          ],
        ),
      ),
    );
  }
}



