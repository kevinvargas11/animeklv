import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:flutter/material.dart';

class MainAnime extends StatelessWidget {
  const MainAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Animes?>(
      future: Gets().getPopulares,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: (CircularProgressIndicator.adaptive()),
          );
        }
        final Animes? getPopulares = snapshot.data;
        return ListView.builder(
            itemCount: getPopulares?.results.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(getPopulares!.results[index].title.userPreferred),
              );
            });
      },
    ));
  }
}
