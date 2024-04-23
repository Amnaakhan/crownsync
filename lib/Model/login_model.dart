// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  User? user;
  String? token;

  LoginModel({
    this.user,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class Log {
  int? id;
  User? userId;
  String? provider;
  String? providerId;
  String? providerToken;
  String? contact;

  Log({
    this.id,
    this.userId,
    this.provider,
    this.providerId,
    this.providerToken,
    this.contact,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
    id: json["id"],
    userId: User.fromJson(json["user_id"]),
    provider: json["provider"],
    providerId: json["provider_id"],
    providerToken: json["provider_token"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId?.toJson(),
    "provider": provider,
    "provider_id": providerId,
    "provider_token": providerToken,
    "contact": contact,
  };
}

class User {
  String? name;
  String? type;
  String? email;
  dynamic address;
  dynamic phone;
  dynamic profile;
  String? createdAt;
  List<Log>? logs;

  User({
    this.name,
    this.type,
    this.email,
    this.address,
    this.phone,
    this.profile,
    this.createdAt,
    this.logs,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    type: json["type"],
    email: json["email"],
    address: json["address"],
    phone: json["phone"],
    profile: json["profile"],
    createdAt: json["created_at"],
    logs: List<Log>.from(json["logs"].map((x) => Log.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "email": email,
    "address": address,
    "phone": phone,
    "profile": profile,
    "created_at": createdAt,
    "logs": List<dynamic>.from(logs!.map((x) => x.toJson())),
  };
}
