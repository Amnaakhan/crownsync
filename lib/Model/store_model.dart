// To parse this JSON data, do
//
//     final storedata = storedataFromJson(jsonString);

import 'dart:convert';

Storedata storedataFromJson(String str) => Storedata.fromJson(json.decode(str));

String storedataToJson(Storedata data) => json.encode(data.toJson());

class Storedata {
  String? message;
  List<Datum>? data;

  Storedata({
    this.message,
    this.data,
  });

  factory Storedata.fromJson(Map<String, dynamic> json) => Storedata(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? userId;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
