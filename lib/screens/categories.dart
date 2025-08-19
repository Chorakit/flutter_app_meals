import 'package:flutter/material.dart';
import 'package:flutter_app_meals/data/dummy_data.dart';
import 'package:flutter_app_meals/models/categorty.dart';
import 'package:flutter_app_meals/widgets/dategory_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pick your category')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //...availableCategories.map((category) => CategoryGridItem(category: category)).toList();
          for (final category in availableCategories)
            CategoryGridItem(category: category),
        ],
      ),
    );
  }
}
