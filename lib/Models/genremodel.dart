import 'dart:convert';

List<Genremodel> genremodelFromJson(String str) =>
    List<Genremodel>.from(json.decode(str).map((x) => Genremodel.fromJson(x)));

String genremodelToJson(List<Genremodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Genremodel {
  Genremodel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Genremodel.fromJson(Map<String, dynamic> json) => Genremodel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
