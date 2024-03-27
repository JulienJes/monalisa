import 'package:flutter/material.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key});

  @override
  State<ArtworkWidget> createState() => _ArtworkWidget();

  void setState(Null Function() param0) {}
}

class _ArtworkWidget extends State<ArtworkWidget> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Artwork"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(image: AssetImage("images/Mona_Lisa.jpg")),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.75,
                        child: Icon(Icons.favorite,
                            color: Colors.white, size: 100),
                      ),
                    )
                  ],
                ),
                Text(
                  "Mona Lisa",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Colors.brown,
                  ),
                ),
                Text(
                  "Léonard De Vinci",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.article, color: Colors.brown),
                    InkWell(
                      onTap: _toggleFavorite,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
