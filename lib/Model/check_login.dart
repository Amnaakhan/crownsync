// To parse this JSON data, do
//
//     final checklogin = checkloginFromJson(jsonString);

import 'dart:convert';

Checklogin checkloginFromJson(String str) => Checklogin.fromJson(json.decode(str));

String checkloginToJson(Checklogin data) => json.encode(data.toJson());

class Checklogin {
  Data? data;

  Checklogin({
    this.data,
  });

  factory Checklogin.fromJson(Map<String, dynamic> json) => Checklogin(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  int? id;
  int? userId;
  String? provider;
  String? providerId;
  String? providerToken;
  String? contact;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.provider,
    this.providerId,
    this.providerToken,
    this.contact,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    provider: json["provider"],
    providerId: json["provider_id"],
    providerToken: json["provider_token"],
    contact: json["contact"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "provider": provider,
    "provider_id": providerId,
    "provider_token": providerToken,
    "contact": contact,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
