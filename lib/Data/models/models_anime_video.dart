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
  final Info info;
  final Stream stream;

  VideoAnime({
    required this.code,
    required this.message,
    required this.info,
    required this.stream,
  });

  factory VideoAnime.fromJson(Map<String, dynamic> json) => VideoAnime(
        code: json["code"],
        message: json["message"],
        info: Info.fromJson(json["info"]),
        stream: Stream.fromJson(json["stream"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "info": info.toJson(),
        "stream": stream.toJson(),
      };
}

class Info {
  final String title;
  final String id;

  Info({
    required this.title,
    required this.id,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
      };
}

class Stream {
  final Multi multi;

  Stream({
    required this.multi,
  });

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        multi: Multi.fromJson(json["multi"]),
      );

  Map<String, dynamic> toJson() => {
        "multi": multi.toJson(),
      };
}

class Multi {
  final Main main;

  Multi({
    required this.main,
  });

  factory Multi.fromJson(Map<String, dynamic> json) => Multi(
        main: Main.fromJson(json["main"]),
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
      };
}

class Main {
  final String url;

  Main({
    required this.url,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
