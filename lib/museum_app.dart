import 'package:flutter/material.dart';
import 'package:monalisa/artwork_widget.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const ArtworkWidget(),
    );
  }
}
