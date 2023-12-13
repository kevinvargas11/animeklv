// To parse this JSON data, do
//
//     final videoAnime = videoAnimeFromJson(jsonString);

import 'dart:convert';

VideoAnime videoAnimeFromJson(String str) =>
    VideoAnime.fromJson(json.decode(str));

String videoAnimeToJson(VideoAnime data) => json.encode(data.toJson());

class VideoAnime {
  final int code;
  final String message;
  final Nspl plyr;
  final Nspl nspl;

  VideoAnime({
    required this.code,
    required this.message,
    required this.plyr,
    required this.nspl,
  });

  factory VideoAnime.fromJson(Map<String, dynamic> json) => VideoAnime(
        code: json["code"],
        message: json["message"],
        plyr: Nspl.fromJson(json["plyr"]),
        nspl: Nspl.fromJson(json["nspl"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "plyr": plyr.toJson(),
        "nspl": nspl.toJson(),
      };
}

class Nspl {
  final String main;
  final String backup;

  Nspl({
    required this.main,
    required this.backup,
  });

  factory Nspl.fromJson(Map<String, dynamic> json) => Nspl(
        main: json["main"],
        backup: json["backup"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "backup": backup,
      };
}
