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
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? type;
  String? email;
  dynamic address;
  dynamic phone;
  dynamic profile;
  String? createdAt;
  List<dynamic>? templates;
  List<dynamic>? store;
  List<dynamic>? location;

  Data({
    this.id,
    this.name,
    this.type,
    this.email,
    this.address,
    this.phone,
    this.profile,
    this.createdAt,
    this.templates,
    this.store,
    this.location,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    profile: json["profile"],
    createdAt: json["created_at"],
    templates: List<dynamic>.from(json["templates"].map((x) => x)),
    store: List<dynamic>.from(json["store"].map((x) => x)),
    location: List<dynamic>.from(json["location"].map((x) => x)),
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
    "templates": List<dynamic>.from(templates!.map((x) => x)),
    "store": List<dynamic>.from(store!.map((x) => x)),
    "location": List<dynamic>.from(location!.map((x) => x)),
  };
}
