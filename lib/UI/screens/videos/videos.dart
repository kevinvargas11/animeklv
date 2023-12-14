import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:animeklv/Data/models/models_anime_video.dart';
import 'package:animeklv/Domain/peticiones/peticionesd.dart';
import 'package:flutter/material.dart';

// ... (importaciones previas)

class ScreenVideos extends StatelessWidget {
  final Episode episodeData;

  const ScreenVideos({Key? key, required this.episodeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Episodio'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(episodeData.id.toString()),
          ),
          FutureBuilder<VideoAnime>(
            future: Gets().getVideoAnime(episodeData.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text('No se encontraron datos'),
                );
              } else {
                // Datos recibidos con éxito
                VideoAnime videoAnime = snapshot.data!;

                // Ahora puedes mostrar los datos en tu interfaz de usuario
                return Column(
                  children: [
                    // Muestra los datos de videoAnime como lo desees

                    // Agrega más widgets para mostrar otros detalles si es necesario
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
