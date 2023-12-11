import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:flutter/material.dart';

class MainAnime extends StatelessWidget {
  const MainAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Animes>(
        future: Gets().getPopulares(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final Animes getPopulares = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal, // Añade esta línea
            itemCount: getPopulares.results.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.all(8.0), // Añade márgenes según tus necesidades
                child: Row(
                  children: [
                    Image.network(
                      getPopulares.results[index].coverImage.medium,
                    ),
                    // Otros widgets o detalles que desees mostrar
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
