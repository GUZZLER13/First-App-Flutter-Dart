import 'package:flutter/material.dart';
import 'package:untitled/favorite_widget.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

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
                    child: const Text('pizza facile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                Text("Stef DS",
                    style: TextStyle(color: Colors.grey[700], fontSize: 20))
              ],
            ),
          ),
          const FavoriteWidget(favoriteCount: 56, isFavorited: false,)
        ],
      ),
    ));

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        "Per hoc minui studium suum existimans "
            "Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem "
            "periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente "
            "abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocquedeformi genere "
            "mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum."
            "Per hoc minui studium suum existimans "
            "Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem "
            "periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente "
            "abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocquedeformi genere "
            "mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum."
            "Per hoc minui studium suum existimans "
            "Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem "
            "periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente "
            "abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocquedeformi genere "
            "mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum."
            "Per hoc minui studium suum existimans "
            "Paulus, ut erat in conplicandis negotiis artifex dirus, unde ei Catenae inditum est cognomentum, vicarium ipsum eos quibus praeerat adhuc defensantem ad sortem "
            "periculorum communium traxit. et instabat ut eum quoque cum tribunis et aliis pluribus ad comitatum imperatoris vinctum perduceret: quo percitus ille exitio urgente "
            "abrupto ferro eundem adoritur Paulum. et quia languente dextera, letaliter ferire non potuit, iam districtum mucronem in proprium latus inpegit. hocquedeformi genere "
            "mortis excessit e vita iustissimus rector ausus miserabiles casus levare multorum.",
        softWrap: true,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("mes recettes"),
        ),
        body: ListView(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "images/loader.gif",
              image:
              'https://www.atelierdeschefs.com/media/recette-e30299-pizza-pepperoni-tomate-mozza.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            descriptionSection
          ],
        ));
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