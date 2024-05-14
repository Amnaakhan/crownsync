// To parse this JSON data, do
//
//     final locationdata = locationdataFromJson(jsonString);

import 'dart:convert';

Locationdata locationdataFromJson(String str) => Locationdata.fromJson(json.decode(str));

String locationdataToJson(Locationdata data) => json.encode(data.toJson());

class Locationdata {
  String? message;
  List<Datum>? data;

  Locationdata({
    this.message,
    this.data,
  });

  factory Locationdata.fromJson(Map<String, dynamic> json) => Locationdata(
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
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "location": location,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
