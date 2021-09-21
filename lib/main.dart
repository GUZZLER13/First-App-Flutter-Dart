import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/recipe_screen.dart';

import 'recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RecipeScreen(
        recipe: Recipe(
            "pizza facile",
            "stef DS",
            "https://media-cdn.tripadvisor.com/media/photo-p/0d/ca/11/e6/domino-s-pizza.jpg",
            "faire cuire ton chat au four",
            false,
            50),
      ),
    );
  }
}
