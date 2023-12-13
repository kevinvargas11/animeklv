import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:animeklv/UI/screens/videos/videos.dart';

import 'package:flutter/material.dart';

class MainEpisodios extends StatelessWidget {
  final Result animeData;
  const MainEpisodios({super.key, required this.animeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime ID: ${animeData.id}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Descripción: ${animeData.description}'),
            FutureBuilder<ListaEpisodios>(
              future: Gets().getListaEpisodios(animeData.id.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator.adaptive();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData ||
                    snapshot.data!.episodes.isEmpty) {
                  return const Text('No hay episodios disponibles.');
                } else {
                  final ListaEpisodios getLista = snapshot.data!;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                              'Número de episodios: ${getLista.episodes.length}'),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: getLista.episodes.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print("tocaste el epidosio");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScreenVideos(
                                                episodeData:
                                                    getLista.episodes[index],
                                              )));
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  margin: const EdgeInsets.all(6.0),
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: ListTile(
                                    title: Text(
                                        "${animeData.title.userPreferred} - ${getLista.episodes[index].title}"),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
