// To parse this JSON data, do
//
//     final getUserlist = getUserlistFromJson(jsonString);

import 'dart:convert';

GetUserlist getUserlistFromJson(String str) => GetUserlist.fromJson(json.decode(str));

String getUserlistToJson(GetUserlist data) => json.encode(data.toJson());

class GetUserlist {
  List<Datum> ?data;

  GetUserlist({
    this.data,
  });

  factory GetUserlist.fromJson(Map<String, dynamic> json) => GetUserlist(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int ?id;
  String ?userId;
  String ?userEmail;
  DateTime? createdAt;
  DateTime? updatedAt;
  String ?userName;

  Datum({
    this.id,
    this.userId,
    this.userEmail,
    this.createdAt,
    this.updatedAt,
    this.userName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    userEmail: json["user_email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_email": userEmail,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_name": userName,
  };
}
