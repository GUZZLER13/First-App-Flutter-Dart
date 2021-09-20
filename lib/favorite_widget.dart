import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;

  const FavoriteWidget(
      {Key? key, required this.isFavorited, required this.favoriteCount})
      : super(key: key);

  @override
  _FavoriteWidgetState createState() =>
      _FavoriteWidgetState(this.isFavorited, this.favoriteCount);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited;
  int _favoriteCount;

  _FavoriteWidgetState(this._isFavorited, this._favoriteCount);

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount--;
      } else {
        _isFavorited = true;
        _favoriteCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: _isFavorited
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border_outlined),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        Text('$_favoriteCount')
      ],
    );
  }
}
