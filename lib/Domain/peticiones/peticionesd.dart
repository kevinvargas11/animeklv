import 'package:animeklv/Data/models/models_anime_list.dart';
import 'package:animeklv/Data/models/models_anime_video.dart';
import 'package:animeklv/Data/models/modelsanime.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Gets {
  final String baseUrl = "https://api-amvstrm.nyt92.eu.org/api/v2";

  Future<Animes> getPopulares() async {
    final response = await http.get(Uri.parse("$baseUrl/popular"));

    if (response.statusCode == 200) {
      return compute(animesFromJson, response.body);
    } else {
      // Manejar el error lanzando una excepción
      throw Exception(
          "Error al obtener animes populares. Código de estado: ${response.statusCode}");
    }
  }

  Future<ListaEpisodios> getListaEpisodios(String animeId) async {
    final urlListaEpisodios = "$baseUrl/episode/$animeId";
    //print("URL para obtener la lista de episodios: $url");

    final response = await http.get(Uri.parse(urlListaEpisodios));

    if (response.statusCode == 200) {
      return compute(listaEpisodiosFromJson, response.body);
    } else {
      throw Exception(
        "Error al obtener la lista de episodios. Código de estado: ${response.statusCode}",
      );
    }
  }

  Future<VideoAnime> getVideoAnime(String episodioId) async {
    final urlVideoEpisodios = "$baseUrl/stream/$episodioId";

    print('URL de la solicitud HTTP: $urlVideoEpisodios');

    final response = await http.get(Uri.parse(urlVideoEpisodios));

    if (response.statusCode == 200) {
      return compute(videoAnimeFromJson, response.body);
    } else {
      throw Exception(
        "Error al obtener la lista de videos . Código de estado: ${response.statusCode}",
      );
    }
  }
}
