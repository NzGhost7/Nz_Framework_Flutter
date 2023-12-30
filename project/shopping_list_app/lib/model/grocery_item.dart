// import 'package:flutter/material.dart';

import 'package:shopping_list_app/model/category.dart';

class GroceryItem {
  final String name;
  final String id;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category
  });
}