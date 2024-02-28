import 'dart:convert';

LatestMovies latestMoviesFromJson(String str) =>
    LatestMovies.fromJson(json.decode(str));
String latestMoviesToJson(LatestMovies data) => json.encode(data.toJson());

class LatestMovies {
  int? status;
  Result? result;

  LatestMovies({
    this.status,
    this.result,
  });

  factory LatestMovies.fromJson(Map<String, dynamic> json) => LatestMovies(
        status: json["status"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
      };
}

class Result {
  int? page;
  List<Item>? items;

  Result({
    this.page,
    this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        page: json["page"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Type? type;
  String? title;
  String? imdbId;
  String? embedUrlImdb;
  String? tmdbId;
  String? embedUrlTmdb;

  Item({
    this.type,
    this.title,
    this.imdbId,
    this.embedUrlImdb,
    this.tmdbId,
    this.embedUrlTmdb,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        imdbId: json["imdb_id"],
        embedUrlImdb: json["embed_url_imdb"],
        tmdbId: json["tmdb_id"],
        embedUrlTmdb: json["embed_url_tmdb"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
        "imdb_id": imdbId,
        "embed_url_imdb": embedUrlImdb,
        "tmdb_id": tmdbId,
        "embed_url_tmdb": embedUrlTmdb,
      };
}

enum Type { MOVIE }

final typeValues = EnumValues({"movie": Type.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
