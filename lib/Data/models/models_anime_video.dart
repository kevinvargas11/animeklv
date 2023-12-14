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
  final Iframe iframe;
  final Nspl plyr;
  final Nspl nspl;

  VideoAnime({
    required this.code,
    required this.message,
    required this.info,
    required this.stream,
    required this.iframe,
    required this.plyr,
    required this.nspl,
  });

  factory VideoAnime.fromJson(Map<String, dynamic> json) => VideoAnime(
        code: json["code"],
        message: json["message"],
        info: Info.fromJson(json["info"]),
        stream: Stream.fromJson(json["stream"]),
        iframe: Iframe.fromJson(json["iframe"]),
        plyr: Nspl.fromJson(json["plyr"]),
        nspl: Nspl.fromJson(json["nspl"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "info": info.toJson(),
        "stream": stream.toJson(),
        "iframe": iframe.toJson(),
        "plyr": plyr.toJson(),
        "nspl": nspl.toJson(),
      };
}

class Iframe {
  final String iframeDefault;
  final String backup;

  Iframe({
    required this.iframeDefault,
    required this.backup,
  });

  factory Iframe.fromJson(Map<String, dynamic> json) => Iframe(
        iframeDefault: json["default"],
        backup: json["backup"],
      );

  Map<String, dynamic> toJson() => {
        "default": iframeDefault,
        "backup": backup,
      };
}

class Info {
  final String title;
  final String id;
  final String episode;

  Info({
    required this.title,
    required this.id,
    required this.episode,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        id: json["id"],
        episode: json["episode"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "episode": episode,
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

class Stream {
  final Multi multi;
  final String tracks;

  Stream({
    required this.multi,
    required this.tracks,
  });

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        multi: Multi.fromJson(json["multi"]),
        tracks: json["tracks"],
      );

  Map<String, dynamic> toJson() => {
        "multi": multi.toJson(),
        "tracks": tracks,
      };
}

class Multi {
  final Backup main;
  final Backup backup;

  Multi({
    required this.main,
    required this.backup,
  });

  factory Multi.fromJson(Map<String, dynamic> json) => Multi(
        main: Backup.fromJson(json["main"]),
        backup: Backup.fromJson(json["backup"]),
      );

  Map<String, dynamic> toJson() => {
        "main": main.toJson(),
        "backup": backup.toJson(),
      };
}

class Backup {
  final String url;
  final bool isM3U8;
  final String quality;

  Backup({
    required this.url,
    required this.isM3U8,
    required this.quality,
  });

  factory Backup.fromJson(Map<String, dynamic> json) => Backup(
        url: json["url"],
        isM3U8: json["isM3U8"],
        quality: json["quality"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "isM3U8": isM3U8,
        "quality": quality,
      };
}
