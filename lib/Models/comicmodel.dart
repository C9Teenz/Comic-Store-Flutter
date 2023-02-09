// To parse this JSON data, do
//
//     final comicModel = comicModelFromJson(jsonString);

import 'dart:convert';

List<ComicModel> comicModelFromJson(String str) =>
    List<ComicModel>.from(json.decode(str).map((x) => ComicModel.fromJson(x)));

String comicModelToJson(List<ComicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComicModel {
  ComicModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creator,
    required this.price,
    required this.stock,
    required this.rating,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.genres,
  });

  int id;
  String name;
  String image;
  String creator;
  int price;
  int stock;
  double rating;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<Genre> genres;

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creator: json["creator"],
        price: json["price"],
        stock: json["stock"],
        rating: json["rating"]?.toDouble(),
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creator": creator,
        "price": price,
        "stock": stock,
        "rating": rating,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.name,
    required this.comicgenre,
  });

  String name;
  Comicgenre comicgenre;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"],
        comicgenre: Comicgenre.fromJson(json["comicgenre"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "comicgenre": comicgenre.toJson(),
      };
}

class Comicgenre {
  Comicgenre({
    required this.comicId,
    required this.genreId,
    required this.createdAt,
    required this.updatedAt,
  });

  int comicId;
  int genreId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Comicgenre.fromJson(Map<String, dynamic> json) => Comicgenre(
        comicId: json["comicId"],
        genreId: json["genreId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "comicId": comicId,
        "genreId": genreId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
