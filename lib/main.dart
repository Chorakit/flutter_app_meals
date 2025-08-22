import 'package:flutter/material.dart';
import 'package:flutter_app_meals/data/dummy_data.dart';
import 'package:flutter_app_meals/screens/categories.dart';
import 'package:flutter_app_meals/screens/meals.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: CategoriesScreen(),
      //home: const MealsScreen(title: 'Some category', meals: dummyMeals),
    );
  }
}
