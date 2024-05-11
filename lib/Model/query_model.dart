// To parse this JSON data, do
//
//     final querydata = querydataFromJson(jsonString);

import 'dart:convert';

Querydata querydataFromJson(String str) => Querydata.fromJson(json.decode(str));

String querydataToJson(Querydata data) => json.encode(data.toJson());

class Querydata {
  List<Datum>? data;

  Querydata({
    this.data,
  });

  factory Querydata.fromJson(Map<String, dynamic> json) => Querydata(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? query;
  User? user;
  String? createdAt;

  Datum({
    this.id,
    this.query,
    this.user,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    query: json["query"],
    user: User.fromJson(json["user"]),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "query": query,
    "user": user?.toJson(),
    "created_at": createdAt,
  };
}

class User {
  int? id;
  String? type;
  dynamic googleId;
  dynamic gauthType;
  dynamic googleToken;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic profile;
  dynamic address;
  dynamic phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic link;
  dynamic benefits;
  dynamic features;

  User({
    this.id,
    this.type,
    this.googleId,
    this.gauthType,
    this.googleToken,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.profile,
    this.address,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.link,
    this.benefits,
    this.features,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    type: json["type"],
    googleId: json["google_id"],
    gauthType: json["gauth_type"],
    googleToken: json["google_token"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    profile: json["profile"],
    address: json["address"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    link: json["link"],
    benefits: json["benefits"],
    features: json["features"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "google_id": googleId,
    "gauth_type": gauthType,
    "google_token": googleToken,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "profile": profile,
    "address": address,
    "phone": phone,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "link": link,
    "benefits": benefits,
    "features": features,
  };
}
