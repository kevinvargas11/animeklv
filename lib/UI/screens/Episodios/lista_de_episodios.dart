import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:flutter/material.dart';

class MainEpisodios extends StatelessWidget {
  final Result animeata;
  const MainEpisodios({super.key, required this.animeata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Anime ID: ${animeata.id}',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Descripción: ${animeata.description}'),
          ],
        ),
      ),
    );
  }
}
