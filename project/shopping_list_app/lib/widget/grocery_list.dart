// ignore_for_file: duplicate_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/grocery_item.dart';
import 'package:shopping_list_app/widget/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  late List<GroceryItem> _groceryItems = [];

  void _loadItem() async {
    final url = Uri.https(
        'shopping-list-db-2b5d5-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping_list.json');
        final response = await http.get(url);
        print('Debug1');
        print(response.body);
        final Map<String, dynamic> listData = json.decode(response.body);
        print('Debug2');
        print(listData);
        final List<GroceryItem> _loadedItem = [];
        for (final item in listData.entries) {
          final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value['category']
          ).value;
          _loadedItem.add(
            GroceryItem(id: item.key, name: item.value['name'], quantity: item.value['quantity'], category: category)
          );
        }
        setState(() {
          _groceryItems = _loadedItem;
        });
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    _loadItem();
    // if (newItem == null) {
    //   return;
    // }

    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Data added yet'),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
            },
            key: ValueKey(_groceryItems[index].id),
            child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(_groceryItems[index].quantity.toString()),
            )),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Groceries'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: content

        // ListView.builder(
        //   itemCount: _groceryItems.length,
        //   itemBuilder: (ctx, index) => ListTile(
        //     title: Text(_groceryItems[index].name),
        //     leading: Container(
        //       width: 24,
        //       height: 24,
        //       color: _groceryItems[index].category.color,
        //     ),
        //     trailing: Text(
        //       _groceryItems[index].quantity.toString(),
        //     ),
        //   ),
        // ),
        );
  }
}
