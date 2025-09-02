import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_meals/models/categorty.dart';
import 'package:flutter_app_meals/models/meal.dart';
import 'package:flutter_app_meals/providers/meal_provider.dart';
import 'package:flutter_app_meals/screens/meals.dart';
import 'package:flutter_app_meals/widgets/dategory_grid_item.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals =
        availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(title: category.title, meals: filterMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableCategories = ref.watch(availableCategoriesProvider);
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //...availableCategories.map((category) => CategoryGridItem(category: category)).toList();
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
