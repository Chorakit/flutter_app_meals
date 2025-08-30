import 'package:flutter_app_meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    state = [];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((Ref) {
      return FavoriteMealNotifier();
    });
