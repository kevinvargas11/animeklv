// To parse this JSON data, do
//
//     final listaEpisodios = listaEpisodiosFromJson(jsonString);

import 'dart:convert';

ListaEpisodios listaEpisodiosFromJson(String str) =>
    ListaEpisodios.fromJson(json.decode(str));

String listaEpisodiosToJson(ListaEpisodios data) => json.encode(data.toJson());

class ListaEpisodios {
  final int code;
  final List<Episode> episodes;

  ListaEpisodios({
    required this.code,
    required this.episodes,
  });

  factory ListaEpisodios.fromJson(Map<String, dynamic> json) => ListaEpisodios(
        code: json["code"],
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  final String id;
  final String title;
  final int number;
  final String? image;
  final dynamic airDate;
  final dynamic description;

  Episode({
    required this.id,
    required this.title,
    required this.number,
    this.image,
    this.airDate,
    this.description,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        title: json["title"],
        number: json["number"],
        image: json["image"],
        airDate: json["airDate"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "number": number,
        "image": image,
        "airDate": airDate,
        "description": description,
      };
}
