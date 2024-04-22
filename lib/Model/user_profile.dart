// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  Data? data;

  ProfileModel({
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  String? name;
  String? type;
  String? email;
  dynamic address;
  dynamic phone;
  dynamic profile;
  String? createdAt;

  Data({
    this.name,
    this.type,
    this.email,
    this.address,
    this.phone,
    this.profile,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    type: json["type"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    profile: json["profile"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "email": email,
    "address": address,
    "phone": phone,
    "profile": profile,
    "created_at": createdAt,
  };
}
