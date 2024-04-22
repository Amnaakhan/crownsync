// To parse this JSON data, do
//
//     final userlist = userlistFromJson(jsonString);

import 'dart:convert';

Userlist userlistFromJson(String str) => Userlist.fromJson(json.decode(str));

String userlistToJson(Userlist data) => json.encode(data.toJson());

class Userlist {
  List<Datum>? data;

  Userlist({
    this.data,
  });

  factory Userlist.fromJson(Map<String, dynamic> json) {
    return Userlist(
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : [],
    );
  }
  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? type;
  String? googleId;
  String? gauthType;
  String? googleToken;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? profile;
  String? address;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    googleId: json["google_id"],
    gauthType: json["gauth_type"],
    googleToken: json["google_token"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    profile: json["profile"],
    address: json["address"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "google_id": googleId,
    "gauth_type": gauthType,
    "google_token": googleToken,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "profile": profile,
    "address": address,
    "phone": phone,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
