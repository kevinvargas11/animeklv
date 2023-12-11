// To parse this JSON data, do
//
//     final animes = animesFromJson(jsonString);

import 'dart:convert';

Animes animesFromJson(String str) => Animes.fromJson(json.decode(str));

String animesToJson(Animes data) => json.encode(data.toJson());

class Animes {
  final int code;
  final List<Result> results;

  Animes({
    required this.code,
    required this.results,
  });

  factory Animes.fromJson(Map<String, dynamic> json) => Animes(
        code: json["code"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final int id;
  final int idMal;
  final String status;
  final Title title;
  final List<String> genres;
  final String description;
  final String bannerImage;
  final CoverImage coverImage;
  final int? episodes;
  final int meanScore;
  final int duration;
  final String season;
  final int seasonYear;
  final int averageScore;

  Result({
    required this.id,
    required this.idMal,
    required this.status,
    required this.title,
    required this.genres,
    required this.description,
    required this.bannerImage,
    required this.coverImage,
    this.episodes,
    required this.meanScore,
    required this.duration,
    required this.season,
    required this.seasonYear,
    required this.averageScore,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        idMal: json["idMal"],
        status: json["status"],
        title: Title.fromJson(json["title"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        description: json["description"],
        bannerImage: json["bannerImage"],
        coverImage: CoverImage.fromJson(json["coverImage"]),
        episodes: json["episodes"],
        meanScore: json["meanScore"],
        duration: json["duration"],
        season: json["season"],
        seasonYear: json["seasonYear"],
        averageScore: json["averageScore"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idMal": idMal,
        "status": status,
        "title": title.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "description": description,
        "bannerImage": bannerImage,
        "coverImage": coverImage.toJson(),
        "episodes": episodes,
        "meanScore": meanScore,
        "duration": duration,
        "season": season,
        "seasonYear": seasonYear,
        "averageScore": averageScore,
      };
}

class CoverImage {
  final String extraLarge;
  final String large;
  final String medium;
  final String? color;

  CoverImage({
    required this.extraLarge,
    required this.large,
    required this.medium,
    this.color,
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        extraLarge: json["extraLarge"],
        large: json["large"],
        medium: json["medium"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "extraLarge": extraLarge,
        "large": large,
        "medium": medium,
        "color": color,
      };
}

class Title {
  final String userPreferred;
  final String romaji;
  final String english;
  final String native;

  Title({
    required this.userPreferred,
    required this.romaji,
    required this.english,
    required this.native,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        userPreferred: json["userPreferred"],
        romaji: json["romaji"],
        english: json["english"],
        native: json["native"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred,
        "romaji": romaji,
        "english": english,
        "native": native,
      };
}
