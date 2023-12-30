//Muhhammad Nazrin Bin Hazrul Nizam
//7/12/2023
//6:12 pm
import 'package:flutter/material.dart';
import 'product.dart';
import 'prod_detail_screen.dart';

List<Product> productList = [
  Product('A1001', 'Penasonic Aircond HP 1.5'),
  Product('A2003', 'Daikin Aircond HP 2.0'),
  Product('A1058', 'Penasonic Vacuum Cleaner'),
];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory App',
      home: ProductScreen(products: productList),
    )
  );
}

class ProductScreen extends StatelessWidget {
  //const ProductScreen({super.key});
  final List<Product> products;
  const ProductScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Product'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(products: products[index])
                  )
                );
            },
          );
        },
      ),
    );
  }
}