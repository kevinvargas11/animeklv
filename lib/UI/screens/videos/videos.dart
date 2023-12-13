import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:flutter/material.dart';

class ScreenVideos extends StatelessWidget {
  final Episode episodeData;
  const ScreenVideos({Key? key, required this.episodeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodio ID: ${episodeData.id}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Título: ${episodeData.title}'),
            // Agrega aquí cualquier otra información que desees mostrar sobre el episodio.
          ],
        ),
      ),
    );
  }
}
