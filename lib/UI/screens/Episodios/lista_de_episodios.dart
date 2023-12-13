import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:animeklv/Data/models/modelsanime.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
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
                  return CircularProgressIndicator.adaptive();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData ||
                    snapshot.data!.episodes.isEmpty) {
                  return Text('No hay episodios disponibles.');
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                              'Número de episodios: ${snapshot.data!.episodes.length}'),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.episodes.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(snapshot.data!.episodes[index].title),
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
