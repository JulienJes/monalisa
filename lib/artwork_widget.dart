import 'package:flutter/material.dart';
import 'package:monalisa/snack_bar.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key});

  @override
  State<ArtworkWidget> createState() => _ArtworkWidget();

  void setState(Null Function() param0) {}
}

class _ArtworkWidget extends State<ArtworkWidget> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _toggleDescription() {
    setState(() {
      if (_showDescription) {
        _showDescription = false;
      } else {
        _showDescription = true;
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
        showSnackBar(context);
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
                  alignment: Alignment.center,
                  children: <Widget>[
                    const Image(image: AssetImage("images/Mona_Lisa.jpg")),
                    _showDescription
                        ? Container()
                        : Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Opacity(
                              opacity: _isFavorite ? 1 : 0.75,
                              child: Icon(Icons.favorite,
                                  color:
                                      _isFavorite ? Colors.red : Colors.white,
                                  size: 100),
                            ),
                          ),
                    _showDescription
                        ? ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 300,
                              maxHeight: 300,
                            ),
                            child: Container(
                              color: Colors.black.withOpacity(0.7),
                              padding: const EdgeInsets.all(10.0),
                              child: const SingleChildScrollView(
                                child: Text(
                                  "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                const Text(
                  "Mona Lisa",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Colors.brown,
                  ),
                ),
                const Text(
                  "Léonard De Vinci",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: _toggleDescription,
                      child: const Icon(Icons.article, color: Colors.brown),
                    ),
                    InkWell(
                      onTap: _toggleFavorite,
                      child: Icon(
                        Icons.favorite,
                        color: _isFavorite ? Colors.brown : Colors.red,
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
