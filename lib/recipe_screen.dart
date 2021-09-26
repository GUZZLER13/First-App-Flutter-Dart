import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/favorite_change_notifier.dart';
import 'package:untitled/favorite_widget.dart';
import 'package:untitled/recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "COMMENT"),
          _buildButtonColumn(Colors.blue, Icons.share, "SHARE"),
        ],
      ),
    );

    Widget titleSection = (Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                Text(recipe.user,
                    style: TextStyle(color: Colors.grey[700], fontSize: 20))
              ],
            ),
          ),
          FavoriteIconWidget(),
          FavoriteTextWidget()
        ],
      ),
    ));

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) =>
          FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("mes recettes"),
          ),
          body: ListView(
            children: [
              // Hero sert à faire le lien entre la petite image et la grande (liste et détail)
              Hero(
                tag: "imageRecipe" + recipe.title,
                child: FadeInImage.assetNetwork(
                  placeholder: "images/loader.gif",
                  image: recipe.imageUrl,
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              titleSection,
              buttonSection,
              descriptionSection
            ],
          )),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Icon(icon, color: color),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      )
    ]);
  }
}
