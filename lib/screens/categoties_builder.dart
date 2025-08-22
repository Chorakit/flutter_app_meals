import 'package:flutter/material.dart';
import 'package:flutter_app_meals/data/dummy_data.dart';
import 'package:flutter_app_meals/screens/meals.dart';
import 'package:flutter_app_meals/widgets/dategory_grid_item.dart';

class CategoriesScreenBuilder extends StatelessWidget {
  const CategoriesScreenBuilder({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: 'Some title', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pick your category')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: availableCategories.length,
        itemBuilder:
            (ctx, index) => CategoryGridItem(
              category: availableCategories[index],
              onSelectCategory: () {
                _selectCategory(context);
              },
            ),
      ),
    );
  }
}
