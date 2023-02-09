import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.comicId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.comics,
  });

  int id;
  int userId;
  int comicId;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  Comics comics;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        comicId: json["comicId"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        comics: Comics.fromJson(json["comics"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "comicId": comicId,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "comics": comics.toJson(),
      };
}

class Comics {
  Comics({
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

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
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
      };
}
