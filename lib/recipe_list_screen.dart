import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/recipe.dart';
import 'package:untitled/recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
        "pizza ffsfdsfdsfsfsfcile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blablabla",
        true,
        20),
    Recipe(
        "fsdfdsfsf",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "bla5555555555blabla",
        true,
        3),
    Recipe(
        "pizza ffsdghfhjgfjhgacile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blablab444444444la",
        true,
        1),
    Recipe(
        "pizza fajkljljkljcile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blabla333333333333bla",
        true,
        2),
    Recipe(
        "pizza flgjklgjlgjacile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blabl2222222222abla",
        true,
        120),
    Recipe(
        "pizzakjljlglg facile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blabla1111111111bla",
        true,
        142),
    Recipe(
        "pizzadfgdfgdqs facile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "bladfsfblabla",
        true,
        162),
    Recipe(
        "pizza facqsdsqdqile",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blablabla",
        true,
        512),
    Recipe(
        "pizza sdfs",
        "Stef DS",
        "https://www.toutlevin.com/img/a0fc4ba355969aa491841847eb63dcc1004740003000-1920.jpg",
        "blablabla",
        true,
        142),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mes recettes"),
        ),

        //Création de la liste
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            //Récupération position (index)
            final recipe = recipes[index];
            // Dismissible ==> on peut swiper et faire disparaitre l'élément
            return Dismissible(
                key: Key(recipe.title),
                onDismissed: (direction) {
                  //le setState met à jour la vue
                  setState(() {
                    recipes.removeAt(index);
                  });
                  //affichage d'un petit message de confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${recipe.title} supprimé")));
                },
                //Arrière-plan de l'élément pendant le swipe
                background: Container(
                  color: Colors.red,
                ),
                child: RecipeItemWidget(recipe: recipe));
          },
        ));
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    //widget Gesturedetector : pour pouvoir gérer le comportement au clic sur l'élément
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  RecipeScreen(recipe: recipe),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              }),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            // Le widget Hero nous sert a faire la transition entre l'image de la liste et l'image de la recette
            Hero(
              tag: "imageRecipe"+ recipe.title,
              child: FadeInImage.assetNetwork(
                placeholder: "images/loader.gif",
                image: recipe.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      recipe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
