import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  Transaction({
    required this.id,
    required this.userId,
    required this.isPayed,
    this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  bool isPayed;
  int? total;
  DateTime createdAt;
  DateTime updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["userId"],
        isPayed: json["isPayed"],
        total: json["total"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "isPayed": isPayed,
        "total": total,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
