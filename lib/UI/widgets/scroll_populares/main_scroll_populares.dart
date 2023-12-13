import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:animeklv/UI/screens/Episodios/lista_de_episodios.dart';
import 'package:flutter/material.dart';

class MainScrollPopulares extends StatelessWidget {
  const MainScrollPopulares({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Puedes ajustar el padding, margen u otras propiedades según tus necesidades
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 350,
      child: FutureBuilder<Animes>(
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
            scrollDirection: Axis.horizontal,
            itemCount: getPopulares.results.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainEpisodios(
                                    animeData: getPopulares.results[index])));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 350,
                            child: Image.network(
                              getPopulares.results[index].coverImage.large,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                color: Colors.black.withOpacity(0.4),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    getPopulares
                                        .results[index].title.userPreferred,
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
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
