// To parse this JSON data, do
//
//     final collectiondata = collectiondataFromJson(jsonString);

import 'dart:convert';

Collectiondata collectiondataFromJson(String str) => Collectiondata.fromJson(json.decode(str));

String collectiondataToJson(Collectiondata data) => json.encode(data.toJson());

class Collectiondata {
  List<Datum>? data;

  Collectiondata({
    this.data,
  });

  factory Collectiondata.fromJson(Map<String, dynamic> json) => Collectiondata(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  User? user;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? rolexModels;

  Datum({
    this.id,
    this.user,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.rolexModels,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    user: User.fromJson(json["user"]),
    name: json["name"],
    slug: json["slug"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    rolexModels: List<dynamic>.from(json["rolexModels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
    "name": name,
    "slug": slug,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "rolexModels": List<dynamic>.from(rolexModels!.map((x) => x)),
  };
}

class User {
  int? id;
  String? name;
  String? type;
  String? email;
  dynamic address;
  dynamic phone;
  dynamic profile;
  String? createdAt;

  User({
    this.id,
    this.name,
    this.type,
    this.email,
    this.address,
    this.phone,
    this.profile,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    profile: json["profile"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "address": address,
    "phone": phone,
    "profile": profile,
    "created_at": createdAt,
  };
}
